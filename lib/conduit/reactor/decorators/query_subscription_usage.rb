require_relative 'base'

module Conduit::Reactor::Decorators
  class QuerySubscriptionUsageDecorator < Base
    def query_subscription_usage_attributes
      {}.tap do |h|
        h[:meid]       = meid       if meid
        h[:mdn]        = mdn        if mdn
        h[:from_date]  = from_date  if from_date
        h[:to_date]    = to_date    if to_date
        h[:usage_type] = usage_type if usage_type
      end
    end
  end
end
