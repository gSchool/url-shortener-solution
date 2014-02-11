require 'sinatra/base'

class UrlShortener < Sinatra::Application
  get '/' do
    erb :index
  end
end