require 'spec_helper'
require 'capybara/rspec'
require_relative '../url_shortener'

Capybara.app = UrlShortener

feature 'URL shortening' do
  scenario 'Allows user to shorten a URL' do
    visit '/'

    fill_in 'url_to_shorten', with: 'http://livingsocial.com'
    click_on 'Shorten'

  end
end