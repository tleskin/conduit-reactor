require_relative 'base'

module Conduit::Reactor::Decorators
  class DeactivateDecorator < Base
    def deactivate_attributes
      auth_token_callback_attributes
    end    
  end
end
