require 'spec_helper'
require 'capybara/rspec'

feature 'Getting it working' do
  scenario 'It works' do
    expect(true).to eq true
  end
end