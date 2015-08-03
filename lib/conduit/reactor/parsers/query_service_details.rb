require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class QueryServiceDetails::Parser < Parser::Base
    attribute :usage_summary do
      object_path('usage_summary')
    end

    attribute :service_period do
      object_path('service_period')
    end

    attribute :line do
      object_path('line')
    end

    attribute :service_buckets do
      object_path('service_buckets')
    end

    attribute :recurring_plans do
      object_path('recurring_plans')
    end

    attribute :carrier_plan do
      object_path('carrier_plan')
    end

    attribute :carrier_services do
      object_path('carrier_services')
    end

    attribute :permanent_carrier_services do
      object_path('permanent_carrier_services')
    end

    def response_content?
      object_path('usage_summary').nil?
    end
  end
end
