require 'sequel'

DB = Sequel.connect('postgres://gschool_user:password@localhost/url_shortener_development')

require './url_shortener'

run UrlShortener