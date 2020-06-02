require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Welcome to Bookmark Manager!"
  end

  get '/bookmarks' do
    "Here is your list of bookmarks"
  end

  run! if app_file == $0

end
