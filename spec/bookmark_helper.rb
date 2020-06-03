def clear_table
  conn = PG.connect( dbname: 'bookmark_manager_test' )
  conn.exec( "TRUNCATE TABLE bookmarks;" )
end

def add_test_data
  Bookmark.create('http://www.google.com')
  Bookmark.create('http://www.makersacademy.com')
  Bookmark.create('http://www.destroyallsoftware.com')
end
