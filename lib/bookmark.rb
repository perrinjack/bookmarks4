require 'pg'

class Bookmark

  attr_reader :urls, :titles

  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )   
    else
      conn = PG.connect( dbname: 'bookmark_manager' )  
    end
    result = conn.exec( "SELECT * FROM bookmarks" )
    @urls = result.map { |bookmark| bookmark["url"] }
    @titles = result.map { |bookmark| bookmark["title"] }
  end

  def self.create(new_url, title)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )   
    else
      conn = PG.connect( dbname: 'bookmark_manager' )  
    end
    conn.exec( "INSERT INTO bookmarks (url, title) VALUES ('#{new_url}', '#{title}')" )
  end

end

