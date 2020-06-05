# frozen_string_literal: true

require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  
  get '/' do
    'Welcome to Bookmark Manager!'
  end

  get '/add-bookmark' do
    erb(:add_bookmark)
  end

  post '/save-bookmark' do
    Bookmark.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:view_bookmarks)
  end

  delete '/bookmarks/:id' do 
    Bookmark.delete(params[:id])
    redirect '/bookmarks'

  end

  run! if app_file == $PROGRAM_NAME
end
