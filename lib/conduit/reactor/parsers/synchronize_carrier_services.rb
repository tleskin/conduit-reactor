require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/line_attributes'

module Conduit::Driver::Reactor
  class SynchronizeCarrierServices::Parser < Parser::Base
    include LineAttributes

    def response_content?
      !@json.nil?
    end
  end
end
