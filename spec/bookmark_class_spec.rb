require 'bookmark'

describe Bookmark do

  describe ".all" do
    list = Bookmark.all
    it "reture a list of bookmarks" do
      expect(list).to include("http://www.google.com")
      expect(list).to include("http://www.makersacademy.com")
      expect(list).to include("http://www.destroyallsoftware.com")
    end
  end

end