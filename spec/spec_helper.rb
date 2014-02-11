ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.order = 'random'
end
