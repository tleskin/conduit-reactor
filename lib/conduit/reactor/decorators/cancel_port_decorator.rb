require_relative 'base'

module Conduit::Reactor::Decorators
  class CancelPortDecorator < Base
    def cancel_port_attributes
      auth_token_callback_attributes
    end
  end
end
