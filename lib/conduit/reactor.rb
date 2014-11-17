require 'conduit/reactor/version'
require 'conduit/reactor/configuration'
require 'conduit/reactor/request_mocker'
require 'conduit'

Conduit.configure do |config|
  config.driver_paths << File.join(File.dirname(__FILE__), 'reactor')
end