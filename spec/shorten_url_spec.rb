require 'spec_helper'
require 'capybara/rspec'
require_relative '../url_shortener'

Capybara.app = UrlShortener

feature 'URL shortening' do
  scenario 'Allows user to shorten a URL' do
    visit '/'

    fill_in 'url_to_shorten', with: 'http://livingsocial.com'
    click_on 'Shorten'

    expect(page).to have_content 'Original URL'
    expect(page).to have_content 'http://livingsocial.com'
    expect(page).to have_content '"Shortened" URL'
    expect(page).to have_content 'http://www.example.com:80/1'
  end
end