require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class Purchase::Parser < Parser::Base
    def response_content?
      !internal_server_error?
    end
  end
end
