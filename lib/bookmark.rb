require 'pg'

class Bookmark
  def self.all
    list = []
    conn = PG.connect( dbname: 'bookmark_manager' )
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.each  do |row|
        list.push(row["url"])
      end
    end
    list
  end
end

