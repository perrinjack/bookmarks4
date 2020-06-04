# frozen_string_literal: true

require 'pg'

class Bookmark
  attr_reader :url, :title

  def initialize(url, title)
    @title = title
    @url = url
  end

  def self.all
    conn = if ENV['RACK_ENV'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test')
           else
             PG.connect(dbname: 'bookmark_manager')
           end
    result = conn.exec('SELECT * FROM bookmarks')

    result.map { |bookmark| Bookmark.new(bookmark['url'], bookmark['title']) }
  end

  def self.create(new_url, title)
    conn = if ENV['RACK_ENV'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test')
           else
             PG.connect(dbname: 'bookmark_manager')
           end
    result = conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{new_url}', '#{title}') RETURNING id, url, title")
    result.map { |bookmark| Bookmark.new(bookmark['url'], bookmark['title']) }
    # Bookmark.new(result[:url], result[2])
  end
end
