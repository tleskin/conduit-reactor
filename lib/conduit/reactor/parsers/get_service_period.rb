require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class GetServicePeriod::Parser < Parser::Base
    attribute :id do
      object_path('service_periods/0/id')
    end

    attribute :uuid do
      object_path('service_periods/0/uuid')
    end

    attribute :subscriber_id do
      object_path('service_periods/0/subscriber_id')
    end

    attribute :service_period_uuid do
      object_path('service_periods/0/subscriber_uuid')
    end

    attribute :posted_at do
      object_path('service_periods/0/posted_at')
    end

    attribute :created_at do
      object_path('service_periods/0/created_at')
    end

    attribute :start_at do
      object_path('service_periods/0/start_at')
    end

    attribute :end_at do
      object_path('service_periods/0/end_at')
    end

    attribute :usage do
      object_path('service_periods/0/usage')
    end

    def response_content?
      !object_path('service_periods').nil?
    end
  end
end
