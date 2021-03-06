ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(url: params['link_url'], title: params['link_name'])
    redirect ('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
