# frozen_string_literal: true

require 'bookmark'
require 'bookmark_helper'

describe Bookmark do
  describe '.all' do
    add_test_data
    bookmarks = Bookmark.all
    it 'return a list instances' do
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks[1]).to be_an_instance_of(Bookmark)
      expect(bookmarks[1].url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create('test.url', 'title')
      expect(bookmark.first).to be_an_instance_of(Bookmark)
      expect(bookmark.first.url).to eq('test.url')
      expect(bookmark.first.title).to eq('title')
    end
  end
end
