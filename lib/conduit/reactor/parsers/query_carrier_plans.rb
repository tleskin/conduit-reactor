require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class QueryCarrierPlans::Parser < Parser::Base
    attribute :carrier_plans do
      object_path('carrier_plans')
    end

    def response_content?
      !object_path('carrier_plans').nil?
    end
  end
end
