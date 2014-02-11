require 'sinatra/base'

class UrlShortener < Sinatra::Application
  set :public_folder, './public'

  get '/' do
    erb :index
  end
end