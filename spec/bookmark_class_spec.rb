require 'bookmark'
require 'bookmark_helper'

describe Bookmark do

  describe ".all" do
    add_test_data
    list = Bookmark.all
    it "reture a list of bookmarks" do
      # expect(list).to include("http://www.google.com")
      # expect(list).to include("http://www.makersacademy.com")
      # expect(list).to include("http://www.destroyallsoftware.com")
      expect(list).to include("Google")
      expect(list).to include("Makers")
      expect(list).to include("Destroy")
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      Bookmark.create('test.url', 'title')
      list = Bookmark.all
      expect(list).to include('title')

    end
  end

end