require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class QuerySubscription::Parser < Parser::Base
    attribute :carrier_data do
      object_path('carrier_data')
    end

    def response_content?
      object_path('carrier_data').nil?
    end
  end
end
