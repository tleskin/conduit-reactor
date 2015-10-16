require_relative 'base'

module Conduit::Reactor::Decorators
  class QueryCarrierServicesDecorator < Base
    def query_carrier_services_attributes
      attributes = {}
      attributes[:by_carrier_id]     = carrier_id if carrier_id

      attributes
    end
  end
end
