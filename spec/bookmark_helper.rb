# frozen_string_literal: true

def clear_table
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('TRUNCATE TABLE bookmarks;')
end

def add_test_data
  Bookmark.create('http://www.google.com', 'Google')
  Bookmark.create('http://www.makersacademy.com', 'Makers')
  Bookmark.create('http://www.destroyallsoftware.com', 'Destroy')
end
