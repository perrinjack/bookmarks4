require 'pg'

class Bookmark
  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )   
    else
      conn = PG.connect( dbname: 'bookmark_manager' )  
    end
    result = conn.exec( "SELECT * FROM bookmarks" )
    result.map { |bookmark| bookmark["url"] }
  end

  def self.create(new_url)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )   
    else
      conn = PG.connect( dbname: 'bookmark_manager' )  
    end
    conn.exec_params( 'INSERT INTO bookmarks (url) VALUES ($1)', [new_url] )
  end

end

