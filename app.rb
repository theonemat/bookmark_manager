require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello World'
  end


  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.create(params[:url])
    redirect '/bookmarks'
  end


  get '/bookmarks' do
    # p ENV

    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end




  run! if app_file == $0
end
