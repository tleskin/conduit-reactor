require_relative 'base'

module Conduit::Reactor::Decorators
  class ChangeNumberDecorator < Base
    def change_number_attributes
      auth_token_callback_attributes
    end
  end
end
