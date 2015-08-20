require_relative 'base'

module Conduit::Reactor::Decorators
  class EndServicePeriodDecorator < Base
    def end_service_period_attributes
      attributes = {}

      attributes[:end_at] = end_at if end_at

      attributes
    end
  end
end
