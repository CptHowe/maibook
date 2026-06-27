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
            commands::import_pdf,
            commands::delete_paper,
            commands::update_paper_meta,
            commands::update_reading_progress,
            commands::pick_pdf_files,
            commands::get_app_data_dir,
        ])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
