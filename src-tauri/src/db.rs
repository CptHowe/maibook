use rusqlite::{Connection, Result, params};

/// Migration definitions: version -> SQL
const MIGRATIONS: &[(u32, &str)] = &[
    (1, r#"
CREATE TABLE IF NOT EXISTS schema_migrations (
    version INTEGER PRIMARY KEY,
    applied_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS papers (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    authors TEXT,
    abstract_text TEXT,
    year INTEGER,
    journal TEXT,
    doi TEXT,
    tags TEXT,
    group_name TEXT,
    file_path TEXT UNIQUE NOT NULL,
    file_hash TEXT,
    page_count INTEGER,
    status TEXT DEFAULT 'unread',
    metadata_source TEXT,
    reading_progress REAL DEFAULT 0.0,
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS annotations (
    id TEXT PRIMARY KEY,
    paper_id TEXT NOT NULL REFERENCES papers(id) ON DELETE CASCADE,
    annotation_type TEXT NOT NULL,
    page_number INTEGER,
    color TEXT,
    rects TEXT,
    selected_text TEXT,
    content TEXT,
    extra_data TEXT,
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_annotations_paper_id ON annotations(paper_id);
CREATE INDEX IF NOT EXISTS idx_annotations_page_number ON annotations(page_number);

CREATE TABLE IF NOT EXISTS bookmarks (
    id TEXT PRIMARY KEY,
    paper_id TEXT NOT NULL REFERENCES papers(id) ON DELETE CASCADE,
    page_number INTEGER NOT NULL,
    label TEXT,
    created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_bookmarks_paper_id ON bookmarks(paper_id);

CREATE TABLE IF NOT EXISTS skills (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    version TEXT,
    author TEXT,
    url TEXT,
    enabled INTEGER NOT NULL DEFAULT 1,
    config TEXT,
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS conversations (
    id TEXT PRIMARY KEY,
    paper_id TEXT REFERENCES papers(id) ON DELETE CASCADE,
    title TEXT,
    messages TEXT NOT NULL DEFAULT '[]',
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS settings (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL
);
"#),
];

/// Initialize the database at `db_path`, apply pending migrations, return Connection.
pub fn init_db(db_path: &str) -> Result<Connection> {
    let conn = Connection::open(db_path)?;

    // Enable WAL mode for better concurrent performance
    conn.execute_batch("PRAGMA journal_mode=WAL; PRAGMA foreign_keys=ON;")?;

    // Ensure schema_migrations table exists (for tracking)
    conn.execute_batch(
        "CREATE TABLE IF NOT EXISTS schema_migrations (
            version INTEGER PRIMARY KEY,
            applied_at TEXT NOT NULL DEFAULT (datetime('now'))
        );"
    )?;

    // Get current schema version
    let current_version: u32 = conn
        .query_row(
            "SELECT COALESCE(MAX(version), 0) FROM schema_migrations",
            [],
            |row| row.get(0),
        )
        .unwrap_or(0);

    // Apply pending migrations
    for (version, sql) in MIGRATIONS {
        if *version > current_version {
            log::info!("Applying migration v{}", version);
            conn.execute_batch(sql)?;
            conn.execute(
                "INSERT INTO schema_migrations (version) VALUES (?1)",
                params![version],
            )?;
            log::info!("Migration v{} applied", version);
        }
    }

    log::info!("Database initialized at version {}", MIGRATIONS.last().map_or(0, |(v, _)| *v));
    Ok(conn)
}
