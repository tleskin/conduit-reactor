require_relative 'base'

module Conduit::Reactor::Decorators
  class SynchronizeCarrierServicesDecorator < Base

    def synchronize_carrier_services_attributes
      auth_token_callback_attributes
    end

  end
end
