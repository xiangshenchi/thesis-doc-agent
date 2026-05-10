-- 1. 删除旧的同步触发器
DROP TRIGGER IF EXISTS notes_after_insert;
DROP TRIGGER IF EXISTS notes_after_delete;
DROP TRIGGER IF EXISTS notes_after_update;

-- 2. 删除旧的全文搜索表
DROP TABLE IF EXISTS notes_fts;

-- 3. 创建包含 'files' 列的新全文搜索虚拟表
CREATE VIRTUAL TABLE notes_fts USING fts5(
  content,
  files,
  content='notes',
  content_rowid='id'
);

-- 4. 从 notes 表中同步现有数据到新的 notes_fts 表
-- 这会让之前的文件名也变得可以搜索
INSERT INTO notes_fts(rowid, content, files) SELECT id, content, files FROM notes;

-- 5. 重新创建同步触发器
CREATE TRIGGER notes_after_insert AFTER INSERT ON notes BEGIN
  INSERT INTO notes_fts(rowid, content, files) VALUES (new.id, new.content, new.files);
END;

CREATE TRIGGER notes_after_delete AFTER DELETE ON notes BEGIN
  INSERT INTO notes_fts(notes_fts, rowid, content, files) VALUES ('delete', old.id, old.content, old.files);
END;

CREATE TRIGGER notes_after_update AFTER UPDATE ON notes BEGIN
  INSERT INTO notes_fts(notes_fts, rowid, content, files) VALUES ('delete', old.id, old.content, old.files);
  INSERT INTO notes_fts(rowid, content, files) VALUES (new.id, new.content, new.files);
END;
