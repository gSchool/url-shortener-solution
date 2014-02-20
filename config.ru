require './url_shortener'
require 'sequel'

DB = Sequel.connect('postgres://gschool_user:password@localhost/url_shortener_development')

run UrlShortener