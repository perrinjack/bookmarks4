require 'pg'

class Bookmark
  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )   
    else
      conn = PG.connect( dbname: 'bookmark_manager' )  
    end
    list = []
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.each { |row| list.push(row["url"]) }
    end
    list
  end
end

