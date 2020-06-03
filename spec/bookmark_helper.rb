def clear_table
  conn = PG.connect( dbname: 'bookmark_manager_test' )
  conn.exec( "TRUNCATE TABLE bookmarks;" )
end

def add_test_data
  conn = PG.connect( dbname: 'bookmark_manager_test' )
  conn.exec( "INSERT INTO bookmarks (url) VALUES ('http://www.google.com');" )
  conn.exec( "INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');" )
  conn.exec( "INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');" )
end
