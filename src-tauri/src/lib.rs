mod db;
mod models;
mod repos;
mod commands;

use std::sync::{Arc, Mutex};
use rusqlite::Connection;
use tauri::Manager;

/// Application state shared across all Tauri commands.
pub struct AppState {
    pub db: Arc<Mutex<Connection>>,
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    tauri::Builder::default()
        .setup(|app| {
            if cfg!(debug_assertions) {
                app.handle().plugin(
                    tauri_plugin_log::Builder::default()
                        .level(log::LevelFilter::Info)
                        .build(),
                )?;
            }

            // Initialize database
            let app_dir = app.path().app_data_dir()?;
            std::fs::create_dir_all(&app_dir)?;
            let db_path = app_dir.join("maibook.db");
            log::info!("Initializing database at: {:?}", db_path);

            let conn = db::init_db(db_path.to_str().unwrap())?;
            let state = AppState {
                db: Arc::new(Mutex::new(conn)),
            };
            app.manage(state);

            log::info!("Maibook initialized successfully");
            Ok(())
        })
        .plugin(tauri_plugin_dialog::init())
       .invoke_handler(tauri::generate_handler![
           commands::get_papers,
           commands::get_paper,
          commands::get_recent_papers,
          commands::get_papers_filtered,
          commands::import_pdf,
           commands::delete_paper,
          commands::trash_paper,
          commands::restore_paper,
          commands::get_trashed_papers,
          commands::update_paper_meta,
          commands::get_all_tags,
          commands::get_all_groups,
         commands::set_paper_tags,
         commands::set_paper_group,
          commands::rename_group,
          commands::delete_group,
          commands::get_group_counts,
          commands::get_ungrouped_count,
          commands::recommend_groups,
         commands::update_reading_progress,
           commands::pick_pdf_files,
           commands::get_app_data_dir,
           commands::get_settings,
           commands::get_setting,
           commands::update_setting,
           commands::read_pdf_base64,
           commands::chat_completion,
          commands::translate_text,
          commands::explain_text,
          commands::summarize_paper,
          commands::generate_paper_tags,
            commands::get_annotations,
            commands::create_annotation,
            commands::update_annotation,
            commands::delete_annotation,
            commands::get_bookmarks,
            commands::create_bookmark,
            commands::delete_bookmark,
          commands::get_skills,
          commands::install_skill,
          commands::toggle_skill,
          commands::delete_skill,
          commands::start_skill_pipeline,
          commands::get_pipeline_results,
          commands::save_pipeline_results,
          
          
          commands::extract_paper_metadata,
          commands::export_maibook,
          commands::import_maibook,
          commands::get_conversations,
          commands::create_conversation,
          commands::save_conversation_messages,
          commands::delete_conversation,
         commands::export_bibtex,
          commands::fetch_models,
      ])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}


