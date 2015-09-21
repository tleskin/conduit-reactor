require_relative 'base'

module Conduit::Reactor::Decorators
  class CancelBucketDecorator < Base
    def cancel_bucket_attributes
      attributes = {}
      attributes[:cancel_recurring_plan] = cancel_recurring_plan if cancel_recurring_plan
      attributes
    end
  end
end
