use serde::{Deserialize, Serialize};

// ===== Paper =====

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Paper {
    pub id: String,
    pub title: String,
    pub authors: Option<String>,
    pub abstract_text: Option<String>,
    pub year: Option<i32>,
    pub journal: Option<String>,
    pub doi: Option<String>,
    pub tags: Option<String>,
    pub group_name: Option<String>,
    pub file_path: String,
    pub file_hash: Option<String>,
    pub page_count: Option<i32>,
    pub status: Option<String>,
    pub metadata_source: Option<String>,
    pub reading_progress: Option<f64>,
    pub created_at: String,
    pub updated_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
pub struct PaperMeta {
    pub title: Option<String>,
    pub authors: Option<String>,
    pub abstract_text: Option<String>,
    pub year: Option<i32>,
    pub journal: Option<String>,
    pub doi: Option<String>,
    pub tags: Option<String>,
    pub group_name: Option<String>,
    pub status: Option<String>,
    pub metadata_source: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
pub struct PaperFilter {
    pub status: Option<String>,
    pub group_name: Option<String>,
    pub tag: Option<String>,
    pub search: Option<String>,
    pub sort_by: Option<String>,
    pub sort_order: Option<String>,
    pub limit: Option<i64>,
    pub offset: Option<i64>,
}

// ===== Annotation =====

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Annotation {
    pub id: String,
    pub paper_id: String,
    pub annotation_type: String,
    pub page_number: Option<i32>,
    pub color: Option<String>,
    pub rects: Option<String>,      // JSON-encoded rects
    pub selected_text: Option<String>,
    pub content: Option<String>,
    pub extra_data: Option<String>, // JSON-encoded extra data
    pub created_at: String,
    pub updated_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CreateAnnotation {
    pub paper_id: String,
    pub annotation_type: String,
    pub page_number: Option<i32>,
    pub color: Option<String>,
    pub rects: Option<String>,
    pub selected_text: Option<String>,
    pub content: Option<String>,
    pub extra_data: Option<String>,
}

// ===== Bookmark =====

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Bookmark {
    pub id: String,
    pub paper_id: String,
    pub page_number: i32,
    pub label: Option<String>,
    pub created_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CreateBookmark {
    pub paper_id: String,
    pub page_number: i32,
    pub label: Option<String>,
}

// ===== Skill =====

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Skill {
    pub id: String,
    pub name: String,
    pub description: Option<String>,
    pub version: Option<String>,
    pub author: Option<String>,
    pub url: Option<String>,
    pub enabled: bool,
    pub config: Option<String>,
    pub created_at: String,
    pub updated_at: String,
}

// ===== Conversation =====

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Conversation {
    pub id: String,
    pub paper_id: Option<String>,
    pub title: Option<String>,
    pub messages: String, // JSON-encoded array
    pub created_at: String,
    pub updated_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CreateConversation {
    pub paper_id: Option<String>,
    pub title: Option<String>,
}

// ===== Settings =====

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Setting {
    pub key: String,
    pub value: String,
}
