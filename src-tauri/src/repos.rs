use rusqlite::{Connection, Result, params};
use crate::models::*;

// ==================== Papers ====================

pub fn get_papers(conn: &Connection) -> Result<Vec<Paper>> {
    let mut stmt = conn.prepare(
        "SELECT id, title, authors, abstract_text, year, journal, doi, tags, group_name,
                file_path, file_hash, page_count, status, metadata_source, reading_progress,
                created_at, updated_at
         FROM papers ORDER BY updated_at DESC"
    )?;
    let papers = stmt.query_map([], |row| {
        Ok(Paper {
            id: row.get(0)?,
            title: row.get(1)?,
            authors: row.get(2)?,
            abstract_text: row.get(3)?,
            year: row.get(4)?,
            journal: row.get(5)?,
            doi: row.get(6)?,
            tags: row.get(7)?,
            group_name: row.get(8)?,
            file_path: row.get(9)?,
            file_hash: row.get(10)?,
            page_count: row.get(11)?,
            status: row.get(12)?,
            metadata_source: row.get(13)?,
            reading_progress: row.get(14)?,
            created_at: row.get(15)?,
            updated_at: row.get(16)?,
        })
    })?.collect::<Result<Vec<_>>>()?;
    Ok(papers)
}
pub fn get_papers_filtered(conn: &Connection, filter: &PaperFilter) -> Result<Vec<Paper>> {
    let mut conditions: Vec<String> = Vec::new();
    let mut params: Vec<Box<dyn rusqlite::types::ToSql>> = Vec::new();

    if let Some(ref search) = filter.search {
        let s = format!("%{}%", search);
        conditions.push(format!("(title LIKE ?{} OR authors LIKE ?{} OR abstract_text LIKE ?{})", params.len()+1, params.len()+1, params.len()+1));
        params.push(Box::new(s));
    }
    if let Some(ref tag) = filter.tag {
        conditions.push(format!("tags LIKE ?{}", params.len()+1));
        params.push(Box::new(format!("%\"{}\"%", tag)));
    }
    if let Some(ref status) = filter.status {
        conditions.push(format!("status = ?{}", params.len()+1));
        params.push(Box::new(status.clone()));
    }
    if let Some(ref group) = filter.group_name {
        conditions.push(format!("group_name = ?{}", params.len()+1));
        params.push(Box::new(group.clone()));
    }

    let where_clause = if conditions.is_empty() {
        String::new()
    } else {
        format!(" WHERE {}", conditions.join(" AND "))
    };

    // Sort
    let sort_col = match filter.sort_by.as_deref() {
        Some("title") => "title",
        Some("year") => "year",
        Some("created_at") => "created_at",
        Some("updated_at") => "updated_at",
        _ => "updated_at",
    };
    let sort_dir = match filter.sort_order.as_deref() {
        Some("asc") | Some("ASC") => "ASC",
        _ => "DESC",
    };
    let order_clause = format!(" ORDER BY {} {}", sort_col, sort_dir);

    // Limit/Offset
    let limit_clause = if let Some(limit) = filter.limit {
        params.push(Box::new(limit));
        if let Some(offset) = filter.offset {
            params.push(Box::new(offset));
            format!(" LIMIT ?{} OFFSET ?{}", params.len()-1, params.len())
        } else {
            format!(" LIMIT ?{}", params.len())
        }
    } else {
        String::new()
    };

    let sql = format!(
        "SELECT id, title, authors, abstract_text, year, journal, doi, tags, group_name,
                file_path, file_hash, page_count, status, metadata_source, reading_progress,
                created_at, updated_at
         FROM papers{}{}{}",
        where_clause, order_clause, limit_clause
    );

    let param_refs: Vec<&dyn rusqlite::types::ToSql> = params.iter().map(|p| p.as_ref()).collect();
    let mut stmt = conn.prepare(&sql)?;
    let papers = stmt.query_map(param_refs.as_slice(), |row| {
        Ok(Paper {
            id: row.get(0)?,
            title: row.get(1)?,
            authors: row.get(2)?,
            abstract_text: row.get(3)?,
            year: row.get(4)?,
            journal: row.get(5)?,
            doi: row.get(6)?,
            tags: row.get(7)?,
            group_name: row.get(8)?,
            file_path: row.get(9)?,
            file_hash: row.get(10)?,
            page_count: row.get(11)?,
            status: row.get(12)?,
            metadata_source: row.get(13)?,
            reading_progress: row.get(14)?,
            created_at: row.get(15)?,
            updated_at: row.get(16)?,
        })
    })?.collect::<Result<Vec<_>>>()?;
    Ok(papers)
}
 
pub fn get_paper(conn: &Connection, id: &str) -> Result<Option<Paper>> {
    let mut stmt = conn.prepare(
        "SELECT id, title, authors, abstract_text, year, journal, doi, tags, group_name,
                file_path, file_hash, page_count, status, metadata_source, reading_progress,
                created_at, updated_at
         FROM papers WHERE id = ?1"
    )?;
    let mut rows = stmt.query(params![id])?;
    match rows.next()? {
        Some(row) => Ok(Some(Paper {
            id: row.get(0)?,
            title: row.get(1)?,
            authors: row.get(2)?,
            abstract_text: row.get(3)?,
            year: row.get(4)?,
            journal: row.get(5)?,
            doi: row.get(6)?,
            tags: row.get(7)?,
            group_name: row.get(8)?,
            file_path: row.get(9)?,
            file_hash: row.get(10)?,
            page_count: row.get(11)?,
            status: row.get(12)?,
            metadata_source: row.get(13)?,
            reading_progress: row.get(14)?,
            created_at: row.get(15)?,
            updated_at: row.get(16)?,
        })),
        None => Ok(None),
    }
}

pub fn get_recent_papers(conn: &Connection, limit: i64) -> Result<Vec<Paper>> {
    let mut stmt = conn.prepare(
        "SELECT id, title, authors, abstract_text, year, journal, doi, tags, group_name,
                file_path, file_hash, page_count, status, metadata_source, reading_progress,
                created_at, updated_at
         FROM papers ORDER BY updated_at DESC LIMIT ?1"
    )?;
    let papers = stmt.query_map(params![limit], |row| {
        Ok(Paper {
            id: row.get(0)?,
            title: row.get(1)?,
            authors: row.get(2)?,
            abstract_text: row.get(3)?,
            year: row.get(4)?,
            journal: row.get(5)?,
            doi: row.get(6)?,
            tags: row.get(7)?,
            group_name: row.get(8)?,
            file_path: row.get(9)?,
            file_hash: row.get(10)?,
            page_count: row.get(11)?,
            status: row.get(12)?,
            metadata_source: row.get(13)?,
            reading_progress: row.get(14)?,
            created_at: row.get(15)?,
            updated_at: row.get(16)?,
        })
    })?.collect::<Result<Vec<_>>>()?;
    Ok(papers)
}

pub fn insert_paper(conn: &Connection, paper: &Paper) -> Result<()> {
    conn.execute(
        "INSERT INTO papers (id, title, authors, abstract_text, year, journal, doi, tags,
                group_name, file_path, file_hash, page_count, status, metadata_source, reading_progress)
         VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12, ?13, ?14, ?15)",
        params![
            paper.id, paper.title, paper.authors, paper.abstract_text,
            paper.year, paper.journal, paper.doi, paper.tags,
            paper.group_name, paper.file_path, paper.file_hash,
            paper.page_count, paper.status, paper.metadata_source,
            paper.reading_progress,
        ],
    )?;
    Ok(())
}

pub fn update_paper_meta(conn: &Connection, id: &str, meta: &PaperMeta) -> Result<()> {
    let mut fields = Vec::new();
    let mut values: Vec<Box<dyn rusqlite::types::ToSql>> = Vec::new();

    if let Some(ref v) = meta.title { fields.push("title = ?"); values.push(Box::new(v.clone())); }
    if let Some(ref v) = meta.authors { fields.push("authors = ?"); values.push(Box::new(v.clone())); }
    if let Some(ref v) = meta.abstract_text { fields.push("abstract_text = ?"); values.push(Box::new(v.clone())); }
    if let Some(ref v) = meta.year { fields.push("year = ?"); values.push(Box::new(v)); }
    if let Some(ref v) = meta.journal { fields.push("journal = ?"); values.push(Box::new(v.clone())); }
    if let Some(ref v) = meta.doi { fields.push("doi = ?"); values.push(Box::new(v.clone())); }
    if let Some(ref v) = meta.tags { fields.push("tags = ?"); values.push(Box::new(v.clone())); }
    if let Some(ref v) = meta.group_name { fields.push("group_name = ?"); values.push(Box::new(v.clone())); }
    if let Some(ref v) = meta.status { fields.push("status = ?"); values.push(Box::new(v.clone())); }
    if let Some(ref v) = meta.metadata_source { fields.push("metadata_source = ?"); values.push(Box::new(v.clone())); }

    if fields.is_empty() {
        return Ok(());
    }

    fields.push("updated_at = datetime('now')");
    let sql = format!("UPDATE papers SET {} WHERE id = ?", fields.join(", "));
    let mut stmt = conn.prepare(&sql)?;
    let mut all_params: Vec<Box<dyn rusqlite::types::ToSql>> = values;
    all_params.push(Box::new(id.to_string()));
    stmt.execute(rusqlite::params_from_iter(all_params.iter().map(|p| p.as_ref())))?;
    Ok(())
}

pub fn delete_paper(conn: &Connection, id: &str) -> Result<()> {
    conn.execute("DELETE FROM papers WHERE id = ?1", params![id])?;
    Ok(())
}

pub fn update_reading_progress(conn: &Connection, id: &str, progress: f64) -> Result<()> {
    conn.execute(
        "UPDATE papers SET reading_progress = ?1, updated_at = datetime('now') WHERE id = ?2",
        params![progress, id],
    )?;
    Ok(())
}

// ==================== Annotations ====================

pub fn get_annotations(conn: &Connection, paper_id: &str) -> Result<Vec<Annotation>> {
    let mut stmt = conn.prepare(
        "SELECT id, paper_id, annotation_type, page_number, color, rects, selected_text,
                content, extra_data, created_at, updated_at
         FROM annotations WHERE paper_id = ?1 ORDER BY page_number, created_at"
    )?;
    let annotations = stmt.query_map(params![paper_id], |row| {
        Ok(Annotation {
            id: row.get(0)?,
            paper_id: row.get(1)?,
            annotation_type: row.get(2)?,
            page_number: row.get(3)?,
            color: row.get(4)?,
            rects: row.get(5)?,
            selected_text: row.get(6)?,
            content: row.get(7)?,
            extra_data: row.get(8)?,
            created_at: row.get(9)?,
            updated_at: row.get(10)?,
        })
    })?.collect::<Result<Vec<_>>>()?;
    Ok(annotations)
}

pub fn create_annotation(conn: &Connection, id: &str, data: &CreateAnnotation) -> Result<()> {
    conn.execute(
        "INSERT INTO annotations (id, paper_id, annotation_type, page_number, color, rects,
                selected_text, content, extra_data)
         VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9)",
        params![
            id, data.paper_id, data.annotation_type, data.page_number,
            data.color, data.rects, data.selected_text, data.content,
            data.extra_data,
        ],
    )?;
    Ok(())
}

pub fn update_annotation(conn: &Connection, id: &str, content: Option<&str>, color: Option<&str>) -> Result<()> {
    let mut fields = Vec::new();
    let mut values: Vec<Box<dyn rusqlite::types::ToSql>> = Vec::new();

    if let Some(v) = content { fields.push("content = ?"); values.push(Box::new(v.to_string())); }
    if let Some(v) = color { fields.push("color = ?"); values.push(Box::new(v.to_string())); }

    if fields.is_empty() {
        return Ok(());
    }

    fields.push("updated_at = datetime('now')");
    let sql = format!("UPDATE annotations SET {} WHERE id = ?", fields.join(", "));
    let mut stmt = conn.prepare(&sql)?;
    let mut all_params = values;
    all_params.push(Box::new(id.to_string()));
    stmt.execute(rusqlite::params_from_iter(all_params.iter().map(|p| p.as_ref())))?;
    Ok(())
}

pub fn delete_annotation(conn: &Connection, id: &str) -> Result<()> {
    conn.execute("DELETE FROM annotations WHERE id = ?1", params![id])?;
    Ok(())
}

// ==================== Bookmarks ====================

pub fn get_bookmarks(conn: &Connection, paper_id: &str) -> Result<Vec<Bookmark>> {
    let mut stmt = conn.prepare(
        "SELECT id, paper_id, page_number, label, created_at
         FROM bookmarks WHERE paper_id = ?1 ORDER BY page_number"
    )?;
    let bookmarks = stmt.query_map(params![paper_id], |row| {
        Ok(Bookmark {
            id: row.get(0)?,
            paper_id: row.get(1)?,
            page_number: row.get(2)?,
            label: row.get(3)?,
            created_at: row.get(4)?,
        })
    })?.collect::<Result<Vec<_>>>()?;
    Ok(bookmarks)
}

pub fn create_bookmark(conn: &Connection, id: &str, data: &CreateBookmark) -> Result<()> {
    conn.execute(
        "INSERT INTO bookmarks (id, paper_id, page_number, label) VALUES (?1, ?2, ?3, ?4)",
        params![id, data.paper_id, data.page_number, data.label],
    )?;
    Ok(())
}

pub fn delete_bookmark(conn: &Connection, id: &str) -> Result<()> {
    conn.execute("DELETE FROM bookmarks WHERE id = ?1", params![id])?;
    Ok(())
}

// ==================== Skills ====================

pub fn get_installed_skills(conn: &Connection) -> Result<Vec<Skill>> {
    let mut stmt = conn.prepare(
        "SELECT id, name, description, version, author, url, enabled, config, created_at, updated_at
         FROM skills ORDER BY name"
    )?;
    let skills = stmt.query_map([], |row| {
        Ok(Skill {
            id: row.get(0)?,
            name: row.get(1)?,
            description: row.get(2)?,
            version: row.get(3)?,
            author: row.get(4)?,
            url: row.get(5)?,
            enabled: row.get::<_, i32>(6)? != 0,
            config: row.get(7)?,
            created_at: row.get(8)?,
            updated_at: row.get(9)?,
        })
    })?.collect::<Result<Vec<_>>>()?;
    Ok(skills)
}

pub fn insert_skill(conn: &Connection, skill: &Skill) -> Result<()> {
    conn.execute(
        "INSERT INTO skills (id, name, description, version, author, url, enabled, config)
         VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8)",
        params![
            skill.id, skill.name, skill.description, skill.version,
            skill.author, skill.url, skill.enabled as i32, skill.config,
        ],
    )?;
    Ok(())
}

pub fn toggle_skill(conn: &Connection, id: &str, enabled: bool) -> Result<()> {
    conn.execute(
        "UPDATE skills SET enabled = ?1, updated_at = datetime('now') WHERE id = ?2",
        params![enabled as i32, id],
    )?;
    Ok(())
}

pub fn delete_skill(conn: &Connection, id: &str) -> Result<()> {
    conn.execute("DELETE FROM skills WHERE id = ?1", params![id])?;
    Ok(())
}

// ==================== Conversations ====================

pub fn get_conversations(conn: &Connection, paper_id: Option<&str>) -> Result<Vec<Conversation>> {
    let (sql, ids): (&str, Vec<Box<dyn rusqlite::types::ToSql>>) = match paper_id {
        Some(pid) => (
            "SELECT id, paper_id, title, messages, created_at, updated_at
             FROM conversations WHERE paper_id = ?1 ORDER BY updated_at DESC",
            vec![Box::new(pid.to_string())],
        ),
        None => (
            "SELECT id, paper_id, title, messages, created_at, updated_at
             FROM conversations ORDER BY updated_at DESC",
            vec![],
        ),
    };
    let mut stmt = conn.prepare(sql)?;
    let convs = stmt.query_map(rusqlite::params_from_iter(ids.iter().map(|p| p.as_ref())), |row| {
        Ok(Conversation {
            id: row.get(0)?,
            paper_id: row.get(1)?,
            title: row.get(2)?,
            messages: row.get(3)?,
            created_at: row.get(4)?,
            updated_at: row.get(5)?,
        })
    })?.collect::<Result<Vec<_>>>()?;
    Ok(convs)
}

pub fn create_conversation(conn: &Connection, id: &str, data: &CreateConversation) -> Result<()> {
    conn.execute(
        "INSERT INTO conversations (id, paper_id, title, messages) VALUES (?1, ?2, ?3, '[]')",
        params![id, data.paper_id, data.title],
    )?;
    Ok(())
}

pub fn save_conversation_messages(conn: &Connection, id: &str, messages: &str) -> Result<()> {
    conn.execute(
        "UPDATE conversations SET messages = ?1, updated_at = datetime('now') WHERE id = ?2",
        params![messages, id],
    )?;
    Ok(())
}

pub fn delete_conversation(conn: &Connection, id: &str) -> Result<()> {
    conn.execute("DELETE FROM conversations WHERE id = ?1", params![id])?;
    Ok(())
}

// ==================== Settings ====================

pub fn get_settings(conn: &Connection) -> Result<Vec<Setting>> {
    let mut stmt = conn.prepare("SELECT key, value FROM settings")?;
    let settings = stmt.query_map([], |row| {
        Ok(Setting {
            key: row.get(0)?,
            value: row.get(1)?,
        })
    })?.collect::<Result<Vec<_>>>()?;
    Ok(settings)
}

pub fn get_setting(conn: &Connection, key: &str) -> Result<Option<String>> {
    let mut stmt = conn.prepare("SELECT value FROM settings WHERE key = ?1")?;
    let mut rows = stmt.query(params![key])?;
    match rows.next()? {
        Some(row) => Ok(Some(row.get(0)?)),
        None => Ok(None),
    }
}

pub fn update_setting(conn: &Connection, key: &str, value: &str) -> Result<()> {
    conn.execute(
        "INSERT INTO settings (key, value) VALUES (?1, ?2)
         ON CONFLICT(key) DO UPDATE SET value = excluded.value",
        params![key, value],
    )?;
    Ok(())
}
// ==================== Tags & Groups ====================

pub fn get_all_tags(conn: &Connection) -> Result<Vec<String>> {
    let mut stmt = conn.prepare(
        "SELECT DISTINCT tags FROM papers WHERE tags IS NOT NULL AND tags != ''"
    )?;
    let rows = stmt.query_map([], |row| row.get::<_, String>(0))?;
    let mut all_tags: Vec<String> = Vec::new();
    for row in rows {
        let tags_str = row?;
        if let Ok(tags_vec) = serde_json::from_str::<Vec<String>>(&tags_str) {
            for tag in tags_vec {
                let t = tag.trim().to_lowercase();
                if !t.is_empty() && !all_tags.contains(&t) {
                    all_tags.push(t);
                }
            }
        }
    }
    all_tags.sort();
    Ok(all_tags)
}

pub fn get_all_groups(conn: &Connection) -> Result<Vec<String>> {
    let mut stmt = conn.prepare(
        "SELECT DISTINCT group_name FROM papers WHERE group_name IS NOT NULL AND group_name != '' ORDER BY group_name"
    )?;
    let groups = stmt.query_map([], |row| row.get::<_, String>(0))?
        .collect::<Result<Vec<_>>>()?;
    Ok(groups)
}

// ==================== Skill Pipeline Results ====================

pub fn get_pipeline_results(conn: &Connection, paper_id: &str) -> Result<Vec<SkillPipelineResult>> {
    let mut stmt = conn.prepare(
        "SELECT id, paper_id, skill_id, skill_name, content, error, created_at
         FROM skill_pipeline_results WHERE paper_id = ?1 ORDER BY created_at"
    )?;
    let results = stmt.query_map(params![paper_id], |row| {
        Ok(SkillPipelineResult {
            id: row.get(0)?,
            paper_id: row.get(1)?,
            skill_id: row.get(2)?,
            skill_name: row.get(3)?,
            content: row.get(4)?,
            error: row.get(5)?,
            created_at: row.get(6)?,
        })
    })?.collect::<Result<Vec<_>>>()?;
    Ok(results)
}

pub fn save_pipeline_results(conn: &Connection, paper_id: &str, results: &[SavePipelineResult]) -> Result<()> {
    // Delete old results for this paper
    conn.execute("DELETE FROM skill_pipeline_results WHERE paper_id = ?1", params![paper_id])?;

    // Insert new results
    for r in results {
        let id = uuid::Uuid::new_v4().to_string();
        conn.execute(
            "INSERT INTO skill_pipeline_results (id, paper_id, skill_id, skill_name, content, error)
             VALUES (?1, ?2, ?3, ?4, ?5, ?6)",
            params![id, paper_id, r.skill_id, r.skill_name, r.content.as_deref().unwrap_or(""), r.error],
        )?;
    }
    Ok(())
}
