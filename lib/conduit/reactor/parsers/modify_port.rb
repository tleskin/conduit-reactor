require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/port_attributes'

module Conduit::Driver::Reactor
  class ModifyPort::Parser < Parser::Base
    include PortAttributes
  end
end