export interface Paper {
  id: string;
  title: string;
  authors: string | null;
  abstract_text: string | null;
  year: number | null;
  journal: string | null;
  doi: string | null;
  tags: string | null;
  group_name: string | null;
  file_path: string;
  file_hash: string | null;
  page_count: number | null;
  status: string | null;
  metadata_source: string | null;
  reading_progress: number | null;
  created_at: string;
  updated_at: string;
}

export interface PaperMeta {
  title?: string | null;
  authors?: string | null;
  abstract_text?: string | null;
  year?: number | null;
  journal?: string | null;
  doi?: string | null;
  tags?: string | null;
  group_name?: string | null;
  status?: string | null;
  metadata_source?: string | null;
}

export interface Annotation {
  id: string;
  paper_id: string;
  annotation_type: string;
  page_number: number | null;
  color: string | null;
  rects: string | null;
  selected_text: string | null;
  content: string | null;
  extra_data: string | null;
  created_at: string;
  updated_at: string;
}

export interface Bookmark {
  id: string;
  paper_id: string;
  page_number: number;
  label: string | null;
  created_at: string;
}

export interface Skill {
  id: string;
  name: string;
  description: string | null;
  version: string | null;
  author: string | null;
  url: string | null;
  enabled: boolean;
  config: string | null;
  created_at: string;
  updated_at: string;
}

export interface Conversation {
  id: string;
  paper_id: string | null;
  title: string | null;
  messages: string;
  created_at: string;
  updated_at: string;
}

export interface Setting {
  key: string;
  value: string;
}

export interface ChatMessage {
  role: string;
  content: string;
}

export interface PipelineResult {
    skill_id: string;
    skill_name: string;
    content: string | null;
    error: string | null;
}
