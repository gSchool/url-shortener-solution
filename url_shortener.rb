require 'sinatra/base'

class UrlShortener < Sinatra::Application
  set :public_folder, './public'

  set :urls, {}

  get '/' do
    erb :index
  end

  post '/shortened_url' do
    url_to_shorten = params['url_to_shorten']
    max_id = settings.urls.keys.max.nil? ? 0 : settings.urls.keys.max
    new_id = max_id + 1
    settings.urls[new_id] = url_to_shorten

    redirect to("/#{new_id}?stats=true")
  end

  get '/:id' do
    id = params['id'].to_i
    original_url = settings.urls[id]
    shortened_url = "#{request.scheme}://#{request.host}:#{request.port}/#{id}"

    erb :show_shortened_url, locals:{shortened_url: shortened_url, original_url: original_url}
  end
end