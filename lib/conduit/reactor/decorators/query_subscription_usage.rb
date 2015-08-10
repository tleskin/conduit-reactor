require_relative 'base'

module Conduit::Reactor::Decorators
  class QuerySubscriptionUsageDecorator < Base
    def query_subscription_usage_attributes
      {}.tap do |h|
        h[:device_serial_number] = device_serial_number if device_serial_number
        h[:mdn]                  = mdn                  if mdn
        h[:from_date]            = from_date            if from_date
        h[:to_date]              = to_date              if to_date
        h[:usage_type]           = usage_type           if usage_type
      end
    end
  end
end
