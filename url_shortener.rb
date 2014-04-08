require 'sinatra/base'
require './urls'

class UrlShortener < Sinatra::Application
  set :public_folder, './public'
  set :error => ''
  set :url_to_shorten => ''

  get '/favicon.ico' do
    # This is here so /favicon.ico doesn't match the /:id route
  end

  get '/' do
    erb :index, locals:{error: settings.error, url_to_shorten: settings.url_to_shorten}
  end

  post '/shortened_url' do
    url_to_shorten = params['url_to_shorten']

    if url_to_shorten.empty?
      settings.error = 'URL can not be blank'
      settings.url_to_shorten = url_to_shorten
      redirect '/'
    elsif !is_url?(url_to_shorten)
      settings.error = 'The text you entered is not a valid URL'
      settings.url_to_shorten = url_to_shorten
      redirect '/'
    else
      settings.error = ''
      settings.url_to_shorten = ''
      new_id = Urls.create(url_to_shorten)
      redirect to("/#{new_id}?stats=true")
    end
  end

  get '/:id' do
    show_stats = params['stats'] == 'true'
    id = params['id'].to_i
    url = Urls.find(id)

    if show_stats
      erb :show_shortened_url, locals:{shortened_url: shortened_url(request, url), url: url}
    else
      previous_visits = url.visits
      Urls.update(id, visits: previous_visits + 1)
      redirect to(url.original_url)
    end
  end

  private
  # this is a good thing to break out and unit test since you have
  # two acceptance tests to test this code.
  def is_url?(url)
    begin
      # make sure you return true or false, not truthy or falsy
      !!(url =~ URI.regexp(['http', 'https']))
    rescue URI::InvalidURIError
      false
    end
  end

  def shortened_url(request, url)
    "#{request.base_url}/#{url.id}"
  end
end