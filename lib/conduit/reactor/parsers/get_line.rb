require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/line_attributes'

module Conduit::Driver::Reactor
  class GetLine::Parser < Parser::Base
    include LineAttributes
  end
end
