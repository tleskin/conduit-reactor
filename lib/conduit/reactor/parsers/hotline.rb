require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/line_attributes'

module Conduit::Driver::Reactor
  class Hotline::Parser < Parser::Base
    include LineAttributes

    def response_content?
      # Anything that's not a 500 could have a body that we can parse.
      # JSON parse failures are handled in the base parser constructor
      !internal_server_error?
    end

  end
end
