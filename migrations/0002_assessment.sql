CREATE TABLE IF NOT EXISTS subjects (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  class_scope TEXT NOT NULL DEFAULT 'ALL',
  name TEXT NOT NULL,
  sort_order INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS assessment_sessions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  class_code TEXT NOT NULL,
  date TEXT NOT NULL,
  subject_name TEXT NOT NULL,
  assessment_type TEXT NOT NULL,
  title TEXT NOT NULL,
  kkm INTEGER NOT NULL DEFAULT 75,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS assessment_scores (
  session_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  score REAL,
  note TEXT NOT NULL DEFAULT '',
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (session_id, student_id),
  FOREIGN KEY (session_id) REFERENCES assessment_sessions(id) ON DELETE CASCADE,
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_assessment_sessions_class_date ON assessment_sessions(class_code, date);
CREATE INDEX IF NOT EXISTS idx_assessment_scores_session ON assessment_scores(session_id);

INSERT INTO subjects (class_scope, name, sort_order)
SELECT 'ALL', 'PAI', 1 WHERE NOT EXISTS (SELECT 1 FROM subjects WHERE name = 'PAI');
INSERT INTO subjects (class_scope, name, sort_order)
SELECT 'ALL', 'PPKn', 2 WHERE NOT EXISTS (SELECT 1 FROM subjects WHERE name = 'PPKn');
INSERT INTO subjects (class_scope, name, sort_order)
SELECT 'ALL', 'Bahasa Indonesia', 3 WHERE NOT EXISTS (SELECT 1 FROM subjects WHERE name = 'Bahasa Indonesia');
INSERT INTO subjects (class_scope, name, sort_order)
SELECT 'ALL', 'Matematika', 4 WHERE NOT EXISTS (SELECT 1 FROM subjects WHERE name = 'Matematika');
INSERT INTO subjects (class_scope, name, sort_order)
SELECT 'ALL', 'IPAS', 5 WHERE NOT EXISTS (SELECT 1 FROM subjects WHERE name = 'IPAS');
INSERT INTO subjects (class_scope, name, sort_order)
SELECT 'ALL', 'PJOK', 6 WHERE NOT EXISTS (SELECT 1 FROM subjects WHERE name = 'PJOK');
INSERT INTO subjects (class_scope, name, sort_order)
SELECT 'ALL', 'SBdP', 7 WHERE NOT EXISTS (SELECT 1 FROM subjects WHERE name = 'SBdP');
INSERT INTO subjects (class_scope, name, sort_order)
SELECT 'ALL', 'Bahasa Sunda', 8 WHERE NOT EXISTS (SELECT 1 FROM subjects WHERE name = 'Bahasa Sunda');
INSERT INTO subjects (class_scope, name, sort_order)
SELECT 'ALL', 'Bahasa Inggris', 9 WHERE NOT EXISTS (SELECT 1 FROM subjects WHERE name = 'Bahasa Inggris');
