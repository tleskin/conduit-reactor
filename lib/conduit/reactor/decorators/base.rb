require 'delegate'
require 'forwardable'

module Conduit::Reactor::Decorators
  class Base < SimpleDelegator
    extend Forwardable

    def auth_token_callback_attributes
      attributes = {}
      attributes[:auth_token]   = token        if token
      attributes[:callback_url] = callback_url if callback_url

      attributes
    end
  end
end
