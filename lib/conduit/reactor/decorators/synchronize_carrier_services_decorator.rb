require_relative 'base'

module Conduit::Reactor::Decorators
  class SynchronizeCarrierServicesDecorator < Base

    def synchronize_carrier_services_attributes
      attributes = auth_token_callback_attributes

      attributes[:retry_failed_services] = retry_failed_services if retry_failed_services
      attributes
    end

  end
end
