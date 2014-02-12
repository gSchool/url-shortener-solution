require 'sinatra/base'

class UrlShortener < Sinatra::Application
  set :public_folder, './public'

  set :urls, {}

  get '/' do
    erb :index, locals:{error: ''}
  end

  post '/shortened_url' do
    url_to_shorten = params['url_to_shorten']

    if is_url?(url_to_shorten)
      max_id = settings.urls.keys.max.nil? ? 0 : settings.urls.keys.max
      new_id = max_id + 1
      settings.urls[new_id] = url_to_shorten

      redirect to("/#{new_id}?stats=true")
    else
      erb :index, locals:{error: 'The text you entered is not a valid URL'}
    end
  end

  get '/:id' do
    show_stats = params['stats'] == 'true'
    id = params['id'].to_i
    original_url = settings.urls[id]

    if show_stats
      shortened_url = "#{request.scheme}://#{request.host}:#{request.port}/#{id}"

      erb :show_shortened_url, locals:{shortened_url: shortened_url, original_url: original_url}
    else
      redirect to(original_url)
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
end