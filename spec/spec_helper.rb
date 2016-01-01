ENV['RACK_ENV'] = 'test'

require File.expand_path '../../yellowtail.rb', __FILE__
require 'rspec'
require 'rack/test'


module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

# For RSpec 2.x and 3.x
RSpec.configure { |c| c.include RSpecMixin }

