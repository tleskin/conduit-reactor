require 'conduit/reactor'
require 'conduit/reactor/driver'
require 'rspec/its'
include Conduit::Driver::Reactor

Dir[File.join(File.dirname(__FILE__), 'support', '**', '*.rb')].each do |f|
  require f
end
