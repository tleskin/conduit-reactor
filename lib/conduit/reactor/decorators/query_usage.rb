require_relative 'base'

module Conduit::Reactor::Decorators
  class QueryUsageDecorator < Base
    def query_usage_attributes
      {}.tap do |h|
        h[:mdn]          = mdn          if mdn
        h[:starting_at]  = starting_at  if starting_at
        h[:ending_at]    = ending_at    if ending_at
        h[:service_type] = service_type if service_type
      end
    end
  end
end
