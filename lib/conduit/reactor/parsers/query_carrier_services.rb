require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class QueryCarrierServices::Parser < Parser::Base
    attribute :carrier_services do
      object_path('carrier_services')
    end

    def response_content?
      !object_path('carrier_services').nil?
    end
  end
end
