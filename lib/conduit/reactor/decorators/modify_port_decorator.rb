require_relative 'base'

module Conduit::Reactor::Decorators
  class ModifyPortDecorator < Base
    def modify_port_attributes
      auth_token_callback_attributes
    end
  end
end
