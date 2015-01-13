require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/port_attributes'

module Conduit::Driver::Reactor
  class QueryPortStatus::Parser < Parser::Base
    include PortAttributes
  end
end