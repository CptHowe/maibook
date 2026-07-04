use crate::models::*;
use crate::repos;
use crate::AppState;
use tauri::State;

// ==================== Paper Commands ====================

#[tauri::command]
pub fn get_papers(state: State<'_, AppState>) -> Result<Vec<Paper>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_papers(&conn).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn get_paper(state: State<'_, AppState>, id: String) -> Result<Option<Paper>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_paper(&conn, &id).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn get_recent_papers(state: State<'_, AppState>, limit: i64) -> Result<Vec<Paper>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_recent_papers(&conn, limit).map_err(|e| e.to_string())
}
 
#[tauri::command]
pub fn get_papers_filtered(
    state: State<'_, AppState>,
    filter: PaperFilter,
) -> Result<Vec<Paper>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_papers_filtered(&conn, &filter).map_err(|e| e.to_string())
}
 
#[tauri::command]
     pub fn import_pdf(app: tauri::AppHandle, state: State<'_, AppState>, file_path: String, copy_file: Option<bool>) -> Result<Paper, String> {
         let path = std::path::Path::new(&file_path);
 
         if !path.exists() {
             return Err(format!("File not found: {}", file_path));
         }
 
         // Extract title from filename
         let title = path
             .file_stem()
             .and_then(|s| s.to_str())
             .unwrap_or("Untitled")
             .to_string();
 
         // Count PDF pages
         let page_count = lopdf::Document::load(&file_path)
             .ok()
             .map(|doc| doc.get_pages().len() as i32);
 
         let id = uuid::Uuid::new_v4().to_string();
 
         // Determine final file path: copy to app data if requested
         let final_path = if copy_file.unwrap_or(false) {
             use tauri::Manager;
             let app_dir = app.path().app_data_dir().map_err(|e| e.to_string())?;
             let pdfs_dir = app_dir.join("imported_pdfs");
             std::fs::create_dir_all(&pdfs_dir).map_err(|e| e.to_string())?;
             let dest = pdfs_dir.join(format!("{}.pdf", id));
             std::fs::copy(&file_path, &dest).map_err(|e| format!("Failed to copy PDF: {}", e))?;
             dest.to_string_lossy().to_string()
         } else {
             path.to_string_lossy().to_string()
         };
 
         let paper = Paper {
             id: id.clone(),
             title,
             authors: None,
             abstract_text: None,
             year: None,
             journal: None,
             doi: None,
             tags: None,
             group_name: None,
             file_path: final_path,
             file_hash: None,
             page_count,
             status: Some("unread".to_string()),
             metadata_source: None,
             reading_progress: Some(0.0),
             created_at: String::new(),
             updated_at: String::new(),
         };
 
         let conn = state.db.lock().map_err(|e| e.to_string())?;
         repos::insert_paper(&conn, &paper).map_err(|e| e.to_string())?;
 
         // Read back with auto-generated timestamps
         repos::get_paper(&conn, &id)
             .map_err(|e| e.to_string())?
             .ok_or_else(|| "Failed to retrieve imported paper".to_string())
     }

#[tauri::command]
pub fn delete_paper(state: State<'_, AppState>, id: String) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::delete_paper(&conn, &id).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn update_paper_meta(
    state: State<'_, AppState>,
    id: String,
    meta: PaperMeta,
) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::update_paper_meta(&conn, &id, &meta).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn update_reading_progress(
    state: State<'_, AppState>,
    id: String,
    progress: f64,
) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::update_reading_progress(&conn, &id, progress).map_err(|e| e.to_string())
}

// ==================== Dialog Commands ====================

#[tauri::command]
pub async fn pick_pdf_files(app: tauri::AppHandle) -> Result<Vec<String>, String> {
    use tauri_plugin_dialog::DialogExt;

    let files = app
        .dialog()
        .file()
        .add_filter("PDF", &["pdf"])
        .blocking_pick_files();

    match files {
        Some(paths) => Ok(paths
            .into_iter()
            .filter_map(|p| {
                let path = p.as_path()?;
                Some(path.to_string_lossy().to_string())
            })
            .collect()),
        None => Ok(vec![]),
    }
}

#[tauri::command]
pub fn get_app_data_dir(app: tauri::AppHandle) -> Result<String, String> {
    use tauri::Manager;
    let dir = app.path().app_data_dir().map_err(|e| e.to_string())?;
    Ok(dir.to_string_lossy().to_string())
}

// ==================== Model Fetch ====================

#[tauri::command]
pub async fn fetch_models(
    api_key: String,
    endpoint: String,
    vendor: Option<String>,
) -> Result<Vec<String>, String> {
    let client = reqwest::Client::new();
    let ep = endpoint.trim_end_matches('/');
    let url = format!("{}/models", ep);

    let mut last_error = String::new();
    for attempt in 0..2 {
        if attempt > 0 {
            tokio::time::sleep(std::time::Duration::from_secs(1)).await;
        }

        let response = match client
            .get(&url)
            .header("Authorization", format!("Bearer {}", api_key))
            .send()
            .await
        {
            Ok(r) => r,
            Err(e) => {
                last_error = format!("Request failed: {}", e);
                continue;
            }
        };

        let status = response.status();
        let body_text = response.text().await.unwrap_or_default();

        if status == 429 {
            last_error = format!("Rate limited (429). Please wait and try again.");
            continue;
        }

        if !status.is_success() {
            return Err(format!("API error {}: {}", status, truncate_str(&body_text, 400)));
        }

        let raw: serde_json::Value = serde_json::from_str(&body_text)
            .map_err(|e| format!("JSON parse failed: {}. Body: {}", e, truncate_str(&body_text, 200)))?;

        match extract_model_ids(&raw, vendor.as_deref()) {
            Ok(ids) if !ids.is_empty() => return Ok(ids),
            Ok(_) => {
                last_error = format!("No models found in response. Raw: {}", truncate_str(&body_text, 300));
                continue;
            }
            Err(e) => { last_error = e; continue; }
        }
    }

    Err(last_error)
}

fn truncate_str(s: &str, max_len: usize) -> &str {
    if s.len() <= max_len { s } else { &s[..max_len] }
}

fn extract_model_ids(raw: &serde_json::Value, _vendor: Option<&str>) -> Result<Vec<String>, String> {
    // Strategy 1: OpenAI format { data: [{id: ...}, ...] }
    if let Some(data) = raw.get("data").and_then(|v| v.as_array()) {
        let ids = extract_ids_from_array(data);
        if !ids.is_empty() { return Ok(ids); }
    }
    // Strategy 2: { models: [{id: ...}, ...] }
    if let Some(models) = raw.get("models").and_then(|v| v.as_array()) {
        let ids = extract_ids_from_array(models);
        if !ids.is_empty() { return Ok(ids); }
    }
    // Strategy 3: Direct array
    if let Some(arr) = raw.as_array() {
        let ids = extract_ids_from_array(arr);
        if !ids.is_empty() { return Ok(ids); }
    }
    // Strategy 4: Any array field
    if let Some(obj) = raw.as_object() {
        for (_, value) in obj {
            if let Some(arr) = value.as_array() {
                let ids = extract_ids_from_array(arr);
                if !ids.is_empty() { return Ok(ids); }
            }
        }
    }
    Err("Cannot extract model list from response".to_string())
}

fn extract_ids_from_array(arr: &[serde_json::Value]) -> Vec<String> {
    arr.iter()
        .filter_map(|v| {
            v.get("id")
                .or_else(|| v.get("model"))
                .or_else(|| v.get("name"))
                .or_else(|| v.get("model_id"))
                .and_then(|id| id.as_str().map(String::from))
        })
        .collect()
}

// ==================== Settings Commands ====================

#[tauri::command]
pub fn get_settings(state: State<'_, AppState>) -> Result<Vec<Setting>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_settings(&conn).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn get_setting(state: State<'_, AppState>, key: String) -> Result<Option<String>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_setting(&conn, &key).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn update_setting(state: State<'_, AppState>, key: String, value: String) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::update_setting(&conn, &key, &value).map_err(|e| e.to_string())
}
// ==================== PDF Commands ====================

#[tauri::command]
pub fn read_pdf_base64(file_path: String) -> Result<String, String> {
    use base64::Engine;
    use std::io::Read;
    let mut file = std::fs::File::open(&file_path)
        .map_err(|e| format!("Failed to open PDF: {}", e))?;
    let mut data = Vec::new();
    file.read_to_end(&mut data)
        .map_err(|e| format!("Failed to read PDF: {}", e))?;
    Ok(base64::engine::general_purpose::STANDARD.encode(&data))
}
// ==================== AI Chat Commands ====================
 
fn extract_pdf_first_page_text(file_path: &str) -> Result<String, String> {
    let doc = lopdf::Document::load(file_path).map_err(|e| format!("Failed to load PDF: {}", e))?;
    let pages = doc.get_pages();
    if let Some((page_num, _)) = pages.iter().next() {
        let page_text = doc.extract_text(&[*page_num]).map_err(|e| format!("Failed to extract text: {}", e))?;
        let cleaned: String = page_text
            .chars()
            .filter(|c| c.is_ascii_graphic() || c.is_ascii_whitespace())
            .collect();
        let cleaned = cleaned.split_whitespace().collect::<Vec<_>>().join(" ");
        let truncated: String = cleaned.chars().take(4000).collect();
        return Ok(truncated);
    }
    Err("No pages found in PDF".to_string())
}

/// Derive a human-readable vendor/provider label from the API endpoint URL.
fn get_vendor_label(endpoint: &str) -> &str {
    let ep = endpoint.to_lowercase();
    if ep.contains("deepseek") {
        "深度求索 (DeepSeek)"
    } else if ep.contains("dashscope") || ep.contains("aliyuncs") {
        "阿里云百炼 (DashScope)"
    } else if ep.contains("bigmodel") {
        "智谱 AI (GLM)"
    } else if ep.contains("siliconflow") {
        "硅基流动 (SiliconFlow)"
    } else if ep.contains("moonshot") {
        "月之暗面 (Moonshot)"
    } else if ep.contains("openai") {
        "OpenAI"
    } else {
        "自定义服务商"
    }
}

fn format_ai_footer(endpoint: &str, model: &str) -> String {
    format!("\n\n（文本由AI生成，供应商是{}，模型是{}）", get_vendor_label(endpoint), model)
}

async fn call_api_completion(
    messages: Vec<ChatMessage>,
    api_key: &str,
    endpoint: &str,
    model: &str,
) -> Result<String, String> {
    let client = reqwest::Client::new();
    let request_body = ChatCompletionRequest {
        model: model.to_string(),
        messages,
        temperature: Some(0.7),
        max_tokens: Some(2048),
    };
    let ep = endpoint.trim_end_matches('/').to_string();
    let mut last_error = String::new();

    for attempt in 0..3 {
        if attempt > 0 {
            let delay = std::time::Duration::from_secs(1 << (attempt - 1));
            tokio::time::sleep(delay).await;
        }

        let response = match client
            .post(format!("{}/chat/completions", ep))
            .header("Authorization", format!("Bearer {}", api_key))
            .json(&request_body)
            .send()
            .await
        {
            Ok(resp) => resp,
            Err(e) => {
                last_error = format!("Request failed (attempt {}): {}", attempt + 1, e);
                continue;
            }
        };

        if !response.status().is_success() {
            let status = response.status();
            let text = response.text().await.unwrap_or_default();
            last_error = format!("API error {} (attempt {}): {}", status, attempt + 1, text);
            continue;
        }

        let body: ChatCompletionResponse = match response.json().await {
            Ok(b) => b,
            Err(e) => {
                last_error = format!("Parse failed (attempt {}): {}", attempt + 1, e);
                continue;
            }
        };

        if let Some(choice) = body.choices.into_iter().next() {
            let content = choice.message.content;
            return Ok(content + &format_ai_footer(&ep, model));
        }
        last_error = format!("No response from model (attempt {})", attempt + 1);
    }

    Err(last_error)
}

#[tauri::command]
pub async fn chat_completion(
    messages: Vec<ChatMessage>,
    api_key: String,
    endpoint: String,
    model: String,
) -> Result<String, String> {
    call_api_completion(messages, &api_key, &endpoint, &model).await
}
 
#[tauri::command]
pub async fn translate_text(
    state: State<'_, AppState>,
    text: String,
    source_lang: String,
    target_lang: String,
) -> Result<String, String> {
    let api_key: String;
    let endpoint: String;
    let model: String;
    {
        let conn = state.db.lock().map_err(|e| e.to_string())?;
        api_key = repos::get_setting(&conn, "api_key").map_err(|e| e.to_string())?.unwrap_or_default();
        endpoint = repos::get_setting(&conn, "api_endpoint").map_err(|e| e.to_string())?.unwrap_or_else(|| "https://api.openai.com/v1".to_string());
        model = repos::get_setting(&conn, "api_model").map_err(|e| e.to_string())?.unwrap_or_else(|| "gpt-4o".to_string());
    }
    let system_prompt = format!(
        "You are a professional translator. Translate the following text from {} to {}. Return ONLY the translation, no explanations, no notes, no quotes.",
        source_lang, target_lang
    );
    let messages = vec![
        ChatMessage { role: "system".to_string(), content: system_prompt },
        ChatMessage { role: "user".to_string(), content: text },
    ];
    call_api_completion(messages, &api_key, &endpoint, &model).await
}
 
#[tauri::command]
pub async fn explain_text(
    state: State<'_, AppState>,
    text: String,
    title: String,
    abstract_text: String,
) -> Result<String, String> {
    let api_key: String;
    let endpoint: String;
    let model: String;
    let language: String;
    {
        let conn = state.db.lock().map_err(|e| e.to_string())?;
        api_key = repos::get_setting(&conn, "api_key").map_err(|e| e.to_string())?.unwrap_or_default();
        endpoint = repos::get_setting(&conn, "api_endpoint").map_err(|e| e.to_string())?.unwrap_or_else(|| "https://api.openai.com/v1".to_string());
        model = repos::get_setting(&conn, "api_model").map_err(|e| e.to_string())?.unwrap_or_else(|| "gpt-4o".to_string());
        language = repos::get_setting(&conn, "language").map_err(|e| e.to_string())?.unwrap_or_else(|| "en".to_string());
    }
    let abs = if abstract_text.is_empty() { "Not provided".to_string() } else { abstract_text };
    let lang_label = if language == "zh" { "Chinese" } else { "English" };
    let system_prompt = format!(
        "You are a research assistant helping the user understand an academic paper. \
         Provide a clear, concise explanation of the selected text in the context of the paper.\n\
         Paper title: {}\nAbstract: {}\n\n\
         Explain the selected text, including relevant background, methodology, and significance. \
         Keep the explanation accessible but technically accurate.\n\
         IMPORTANT: Respond in the user's language: {}.",
        title, abs, lang_label
    );
    let messages = vec![
        ChatMessage { role: "system".to_string(), content: system_prompt },
        ChatMessage { role: "user".to_string(), content: format!("Selected text:\n{}", text) },
    ];
    call_api_completion(messages, &api_key, &endpoint, &model).await
}
 
#[tauri::command]
pub async fn summarize_paper(
    state: State<'_, AppState>,
    title: String,
    abstract_text: String,
    full_text: String,
) -> Result<String, String> {
    let api_key: String;
    let endpoint: String;
    let model: String;
    let language: String;
    {
        let conn = state.db.lock().map_err(|e| e.to_string())?;
        api_key = repos::get_setting(&conn, "api_key").map_err(|e| e.to_string())?.unwrap_or_default();
        endpoint = repos::get_setting(&conn, "api_endpoint").map_err(|e| e.to_string())?.unwrap_or_else(|| "https://api.openai.com/v1".to_string());
        model = repos::get_setting(&conn, "api_model").map_err(|e| e.to_string())?.unwrap_or_else(|| "gpt-4o".to_string());
        language = repos::get_setting(&conn, "language").map_err(|e| e.to_string())?.unwrap_or_else(|| "en".to_string());
    }
    let lang_label = if language == "zh" { "Chinese" } else { "English" };
    let system_prompt = format!(
        "You are a research assistant. Generate a concise but comprehensive summary of the following paper. \
        Include: (1) Research problem and motivation, (2) Methods/approach, (3) Key findings and results, \
        (4) Conclusions and implications. Keep the summary well-structured with markdown headings but avoid fluff.\n\
        IMPORTANT: Respond in the user's language: {}.",
        lang_label
    );
    let user_content = if full_text.len() > 30000 {
        format!(
            "Title: {}\n\nAbstract:\n{}\n\nFull Text (truncated to 30000 chars):\n{}",
            title, abstract_text, &full_text[..30000]
        )
    } else {
        format!("Title: {}\n\nAbstract:\n{}\n\nFull Text:\n{}", title, abstract_text, full_text)
    };
    let messages = vec![
        ChatMessage { role: "system".to_string(), content: system_prompt },
        ChatMessage { role: "user".to_string(), content: user_content },
    ];
    call_api_completion(messages, &api_key, &endpoint, &model).await
}
// ==================== Annotation Commands ====================

#[tauri::command]
pub fn get_annotations(state: State<'_, AppState>, paper_id: String) -> Result<Vec<Annotation>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_annotations(&conn, &paper_id).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn create_annotation(
    state: State<'_, AppState>,
    paper_id: String,
    annotation_type: String,
    page_number: Option<i32>,
    color: Option<String>,
    rects: Option<String>,
    selected_text: Option<String>,
    content: Option<String>,
    extra_data: Option<String>,
) -> Result<Annotation, String> {
    let id = uuid::Uuid::new_v4().to_string();
    let data = CreateAnnotation {
        paper_id,
        annotation_type,
        page_number,
        color,
        rects,
        selected_text,
        content,
        extra_data,
    };
    let pid = data.paper_id.clone();
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::create_annotation(&conn, &id, &data).map_err(|e| e.to_string())?;
    repos::get_annotations(&conn, &pid)
        .map_err(|e| e.to_string())?
        .into_iter()
        .find(|a| a.id == id)
        .ok_or_else(|| "Annotation not found after creation".to_string())
}

#[tauri::command]
pub fn update_annotation(
    state: State<'_, AppState>,
    id: String,
    content: Option<String>,
    color: Option<String>,
) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::update_annotation(&conn, &id, content.as_deref(), color.as_deref()).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn delete_annotation(state: State<'_, AppState>, id: String) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::delete_annotation(&conn, &id).map_err(|e| e.to_string())
}

// ==================== Bookmark Commands ====================

#[tauri::command]
pub fn get_bookmarks(state: State<'_, AppState>, paper_id: String) -> Result<Vec<Bookmark>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_bookmarks(&conn, &paper_id).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn create_bookmark(
    state: State<'_, AppState>,
    paper_id: String,
    page_number: i32,
    label: Option<String>,
) -> Result<Bookmark, String> {
    let id = uuid::Uuid::new_v4().to_string();
    let data = CreateBookmark {
        paper_id,
        page_number,
        label,
    };
    let pid = data.paper_id.clone();
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::create_bookmark(&conn, &id, &data).map_err(|e| e.to_string())?;
    repos::get_bookmarks(&conn, &pid)
        .map_err(|e| e.to_string())?
        .into_iter()
        .find(|b| b.id == id)
        .ok_or_else(|| "Bookmark not found after creation".to_string())
}

#[tauri::command]
pub fn delete_bookmark(state: State<'_, AppState>, id: String) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::delete_bookmark(&conn, &id).map_err(|e| e.to_string())
}

// ==================== Skill Commands ====================

#[tauri::command]
pub fn get_skills(state: State<'_, AppState>) -> Result<Vec<Skill>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_installed_skills(&conn).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn install_skill(
    state: State<'_, AppState>,
    name: String,
    description: Option<String>,
    version: Option<String>,
    author: Option<String>,
    url: Option<String>,
    config: Option<String>,
) -> Result<Skill, String> {
    let id = uuid::Uuid::new_v4().to_string();
    let skill = Skill {
        id: id.clone(),
        name,
        description,
        version,
        author,
        url,
        enabled: true,
        config,
        created_at: String::new(),
        updated_at: String::new(),
    };
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::insert_skill(&conn, &skill).map_err(|e| e.to_string())?;
    let skills = repos::get_installed_skills(&conn).map_err(|e| e.to_string())?;
    skills.into_iter().find(|s| s.id == id).ok_or_else(|| "Skill not found after install".to_string())
}

#[tauri::command]
pub fn toggle_skill(state: State<'_, AppState>, id: String, enabled: bool) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::toggle_skill(&conn, &id, enabled).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn delete_skill(state: State<'_, AppState>, id: String) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::delete_skill(&conn, &id).map_err(|e| e.to_string())
}

// ==================== AI Metadata Extraction ====================

#[tauri::command]
pub async fn extract_paper_metadata(
    state: State<'_, AppState>,
    paper_id: String,
) -> Result<Paper, String> {
    let file_path;
    let title_hint;
    let existing_tags;
    {
        let conn = state.db.lock().map_err(|e| e.to_string())?;
        let paper = repos::get_paper(&conn, &paper_id)
            .map_err(|e| e.to_string())?
            .ok_or_else(|| "Paper not found".to_string())?;
        file_path = paper.file_path.clone();
        title_hint = paper.title.clone();
        existing_tags = paper.tags.clone();
    }

    let first_page_text = extract_pdf_first_page_text(&file_path)?;

    let api_key;
    let endpoint;
    let model;
    {
        let conn = state.db.lock().map_err(|e| e.to_string())?;
        api_key = repos::get_setting(&conn, "api_key").map_err(|e| e.to_string())?.unwrap_or_default();
        endpoint = repos::get_setting(&conn, "api_endpoint").map_err(|e| e.to_string())?.unwrap_or_else(|| "https://api.openai.com/v1".to_string());
        model = repos::get_setting(&conn, "api_model").map_err(|e| e.to_string())?.unwrap_or_else(|| "gpt-4o".to_string());
    }

    let system_prompt = "You are a research paper metadata extractor. Given the first page text of an academic paper, extract the following fields and return them as JSON. Do NOT include any text outside the JSON object.\n\nFields:\n- title: string\n- authors: string (comma-separated)\n- abstract_text: string (the abstract, if found)\n- year: number (publication year, or null)\n- journal: string (journal/conference name, or null)\n- doi: string (DOI, or null)\n\nRespond with ONLY a valid JSON object, no other text.".to_string();
    let user_content = format!("Paper filename hint: {}\n\nFirst page text:\n{}", title_hint, first_page_text);
    let messages = vec![
        ChatMessage { role: "system".to_string(), content: system_prompt },
        ChatMessage { role: "user".to_string(), content: user_content },
    ];

    let response_text = call_api_completion(messages, &api_key, &endpoint, &model).await?;

    let json_str = if let Some(start) = response_text.find('{') {
        if let Some(end) = response_text.rfind('}') {
            &response_text[start..=end]
        } else {
            &response_text
        }
    } else {
        &response_text
    };

    #[derive(serde::Deserialize)]
    struct ExtractedMeta {
        title: Option<String>,
        authors: Option<String>,
        abstract_text: Option<String>,
        year: Option<i32>,
        journal: Option<String>,
        doi: Option<String>,
        #[serde(default)]
        tags: Option<Vec<String>>,
    }

    let meta: ExtractedMeta = serde_json::from_str(json_str)
        .map_err(|e| format!("Failed to parse AI response as JSON: {}.\nResponse was: {}", e, response_text))?;

    let paper_meta = PaperMeta {
        title: meta.title.or(Some(title_hint)),
        authors: meta.authors,
        abstract_text: meta.abstract_text,
        year: meta.year,
        journal: meta.journal,
        doi: meta.doi,
        tags: if existing_tags.is_some() { None } else { meta.tags.map(|t| serde_json::to_string(&t).unwrap_or_default()) },
        group_name: None,
        status: Some("unread".to_string()),
        metadata_source: Some("ai".to_string()),
    };

    {
        let conn = state.db.lock().map_err(|e| e.to_string())?;
        repos::update_paper_meta(&conn, &paper_id, &paper_meta).map_err(|e| e.to_string())?;
        let updated = repos::get_paper(&conn, &paper_id)
            .map_err(|e| e.to_string())?
            .ok_or_else(|| "Paper not found after update".to_string())?;
        Ok(updated)
    }
}
// ==================== Tags & Groups Commands ====================

#[tauri::command]
pub fn get_all_tags(state: State<'_, AppState>) -> Result<Vec<String>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_all_tags(&conn).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn get_all_groups(state: State<'_, AppState>) -> Result<Vec<String>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_all_groups(&conn).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn set_paper_tags(
    state: State<'_, AppState>,
    paper_id: String,
    tags: Vec<String>,
) -> Result<(), String> {
    let tags_json = serde_json::to_string(&tags).map_err(|e| e.to_string())?;
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    conn.execute(
        "UPDATE papers SET tags = ?1, updated_at = datetime('now') WHERE id = ?2",
        rusqlite::params![tags_json, paper_id],
    ).map_err(|e| e.to_string())?;
    Ok(())
}

#[tauri::command]
pub fn set_paper_group(
    state: State<'_, AppState>,
    paper_id: String,
    group_name: Option<String>,
) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    conn.execute(
        "UPDATE papers SET group_name = ?1, updated_at = datetime('now') WHERE id = ?2",
        rusqlite::params![group_name, paper_id],
    ).map_err(|e| e.to_string())?;
    Ok(())
}


// ==================== Export / Import ====================

#[tauri::command]
pub async fn export_maibook(
    app: tauri::AppHandle,
    state: State<'_, AppState>,
    export_path: String,
) -> Result<String, String> {
    use tauri::Manager;
    use std::io::Write;

    let app_dir = app.path().app_data_dir().map_err(|e| e.to_string())?;
    let _db_path = app_dir.join("maibook.db");

    // Create a temporary backup copy of the DB using VACUUM INTO
    let temp_backup = app_dir.join("maibook_temp_export.db");
    {
        let conn = state.db.lock().map_err(|e| e.to_string())?;
        let temp_str = temp_backup.to_str().unwrap().replace('\'', "''");
        conn.execute_batch(&format!("VACUUM INTO '{}'", temp_str))
            .map_err(|e| format!("Failed to backup DB: {}", e))?;
    }

    // Collect PDF file paths
    let papers: Vec<Paper>;
    {
        let conn = state.db.lock().map_err(|e| e.to_string())?;
        papers = repos::get_papers(&conn).map_err(|e| e.to_string())?;
    }

    // Create ZIP
    let zip_file = std::fs::File::create(&export_path)
        .map_err(|e| format!("Failed to create export file: {}", e))?;
    let mut zip = zip::ZipWriter::new(zip_file);
    let options = zip::write::SimpleFileOptions::default()
        .compression_method(zip::CompressionMethod::Deflated);


    // Add DB backup
    let db_bytes = std::fs::read(&temp_backup)
        .map_err(|e| format!("Failed to read backup: {}", e))?;
    zip.start_file("maibook.db", options.clone())
        .map_err(|e| e.to_string())?;
    zip.write_all(&db_bytes).map_err(|e| e.to_string())?;

    // Add PDFs
    for paper in &papers {
        let pdf_path = std::path::Path::new(&paper.file_path);
        if pdf_path.exists() {
            let pdf_bytes = std::fs::read(pdf_path)
                .map_err(|e| format!("Failed to read PDF {}: {}", paper.id, e))?;
            zip.start_file(format!("pdfs/{}.pdf", paper.id), options.clone())
                .map_err(|e| e.to_string())?;
            zip.write_all(&pdf_bytes).map_err(|e| e.to_string())?;
        }
    }

    // Add metadata JSON
    let meta = serde_json::json!({
        "version": 1,
        "exported_at": chrono::Utc::now().to_rfc3339(),
        "paper_count": papers.len(),
    });
    zip.start_file("export.json", options.clone()).map_err(|e| e.to_string())?;
    zip.write_all(serde_json::to_string_pretty(&meta).unwrap().as_bytes())
        .map_err(|e| e.to_string())?;

    zip.finish().map_err(|e| e.to_string())?;

    // Clean up temp backup
    std::fs::remove_file(&temp_backup).ok();

    Ok(format!("Exported {} papers to {}", papers.len(), export_path))
}

#[tauri::command]
pub async fn import_maibook(
    app: tauri::AppHandle,
    import_path: String,
) -> Result<String, String> {
    use tauri::Manager;
    use std::io::Read;

    // Open ZIP
    let zip_file = std::fs::File::open(&import_path)
        .map_err(|e| format!("Failed to open import file: {}", e))?;
    let mut archive = zip::ZipArchive::new(zip_file)
        .map_err(|e| format!("Invalid ZIP file: {}", e))?;

    let app_dir = app.path().app_data_dir().map_err(|e| e.to_string())?;
    let db_path = app_dir.join("maibook.db");
    let pdfs_dir = app_dir.join("imported_pdfs");
    std::fs::create_dir_all(&pdfs_dir).map_err(|e| e.to_string())?;

    let mut imported_db = false;
    let mut pdf_count = 0;

    for i in 0..archive.len() {
        let mut entry = archive.by_index(i).map_err(|e| e.to_string())?;
        let name = entry.name().to_string();

        if name == "maibook.db" {
            // Copy the imported DB over the existing one
            let mut data = Vec::new();
            entry.read_to_end(&mut data).map_err(|e| e.to_string())?;
            
            std::fs::write(&db_path, &data).map_err(|e| e.to_string())?;
            imported_db = true;
        } else if name.starts_with("pdfs/") {
            let pdf_name = name.trim_start_matches("pdfs/");
            let dest_path = pdfs_dir.join(pdf_name);
            let mut data = Vec::new();
            entry.read_to_end(&mut data).map_err(|e| e.to_string())?;
            std::fs::write(&dest_path, &data).map_err(|e| e.to_string())?;
            pdf_count += 1;
        }
    }

    if imported_db {
        Ok(format!("Import successful. Restored DB ({} PDFs). Please restart the app for changes to take effect.", pdf_count))
    } else {
        Err("No database found in the export file".to_string())
    }
}

// ==================== Conversation Commands ====================

#[tauri::command]
pub fn get_conversations(
    state: State<'_, AppState>,
    paper_id: Option<String>,
) -> Result<Vec<Conversation>, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::get_conversations(&conn, paper_id.as_deref()).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn create_conversation(
    state: State<'_, AppState>,
    paper_id: Option<String>,
    title: Option<String>,
) -> Result<Conversation, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    let id = uuid::Uuid::new_v4().to_string();
    let data = CreateConversation { paper_id, title };
    repos::create_conversation(&conn, &id, &data).map_err(|e| e.to_string())?;
    Ok(Conversation {
        id,
        paper_id: data.paper_id,
        title: data.title,
        messages: "[]".to_string(),
        created_at: String::new(),
        updated_at: String::new(),
    })
}

#[tauri::command]
pub fn save_conversation_messages(
    state: State<'_, AppState>,
    id: String,
    messages: String,
) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::save_conversation_messages(&conn, &id, &messages).map_err(|e| e.to_string())
}

#[tauri::command]
pub fn delete_conversation(
    state: State<'_, AppState>,
    id: String,
) -> Result<(), String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    repos::delete_conversation(&conn, &id).map_err(|e| e.to_string())
}



// ==================== BibTeX Export ====================

fn format_bibtex_entry(paper: &Paper) -> String {
    let first_author = paper.authors
        .as_deref()
        .unwrap_or("unknown")
        .split(',')
        .next()
        .unwrap_or("unknown")
        .split_whitespace()
        .last()
        .unwrap_or("unknown")
        .to_lowercase();

    let year = paper.year.map(|y| y.to_string()).unwrap_or_else(|| "nodate".to_string());

    let title_word = paper.title
        .split_whitespace()
        .next()
        .map(|w| w.to_lowercase())
        .unwrap_or_else(|| "untitled".to_string());

    let citation_key = format!("{}{}{}", first_author, year, title_word);

    let author_entry = paper.authors.as_deref().unwrap_or("Unknown");
    let title_entry = &paper.title;
    let journal_entry = paper.journal.as_deref().unwrap_or("");
    let doi_entry = paper.doi.as_deref().unwrap_or("");

    let doi_line = if doi_entry.is_empty() {
        String::new()
    } else {
        format!("  doi     = {{{}}},\n", doi_entry)
    };

    // Detect BibTeX entry type based on journal name
    let journal_lower = journal_entry.to_lowercase();
    let (entry_type, venue_field) = if journal_entry.is_empty() {
        ("misc", "")
    } else if journal_lower.contains("proc")
        || journal_lower.contains("conference")
        || journal_lower.contains("symposium")
        || journal_lower.contains("workshop")
        || journal_lower.contains("meeting")
        || journal_lower.contains("annual")
    {
        ("inproceedings", "booktitle")
    } else if journal_lower.contains("book")
        || journal_lower.contains("press")
        || journal_lower.contains("publisher")
    {
        ("book", "publisher")
    } else {
        ("article", "journal")
    };

    let venue_line = if venue_field.is_empty() {
        String::new()
    } else {
        format!("  {:<8}= {{{}}},\n", venue_field, journal_entry)
    };

    format!(
        "@{}{{{},\n  author  = {{{}}},\n  title   = {{{}}},\n{}{}  year    = {{{}}},\n}}",
        entry_type, citation_key, author_entry, title_entry, venue_line, doi_line, year
    )
}

#[tauri::command]
pub fn export_bibtex(
    state: State<'_, AppState>,
    paper_ids: Vec<String>,
) -> Result<String, String> {
    let conn = state.db.lock().map_err(|e| e.to_string())?;
    let mut entries = Vec::new();
    for id in &paper_ids {
        if let Some(paper) = repos::get_paper(&conn, id).map_err(|e| e.to_string())? {
            entries.push(format_bibtex_entry(&paper));
        }
    }
    Ok(entries.join("\n\n"))
}

