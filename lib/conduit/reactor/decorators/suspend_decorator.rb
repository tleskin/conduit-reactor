require_relative 'base'

module Conduit::Reactor::Decorators
  class SuspendDecorator < Base
    def suspend_attributes
      auth_token_callback_attributes
    end    
  end
end
