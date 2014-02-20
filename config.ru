require 'sequel'

database_url = if ENV['HEROKU_POSTGRESQL_TEAL_URL'].nil?
                 'postgres://gschool_user:password@localhost/url_shortener_development'
               else
                 ENV['HEROKU_POSTGRESQL_TEAL_URL']
               end

DB = Sequel.connect(database_url)

require './url_shortener'

run UrlShortener