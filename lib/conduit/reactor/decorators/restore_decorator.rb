require_relative 'base'

module Conduit::Reactor::Decorators
  class RestoreDecorator < Base
    def restore_attributes
      auth_token_callback_attributes
    end
  end
end
