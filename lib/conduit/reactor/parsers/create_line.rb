require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/line_attributes'

module Conduit::Driver::Reactor
  class CreateLine::Parser < Parser::Base
    include LineAttributes
  end
end
