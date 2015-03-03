require_relative 'base'

module Conduit::Reactor::Decorators
  class GetSubscriberDecorator < Base
    def get_subscriber_attributes
      attributes = {}
      attributes[:auth_token]  = token  if token

      attributes
    end
  end
end
