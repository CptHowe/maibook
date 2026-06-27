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
pub fn import_pdf(state: State<'_, AppState>, file_path: String) -> Result<Paper, String> {
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
        file_path: path.to_string_lossy().to_string(),
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
