require_relative 'base'

module Conduit::Reactor::Decorators
  class CreateSubscriberDecorator < Base
    def create_subscriber_attributes
      attributes = {}
      attributes[:auth_token]              = token        if token

      subscriber_attributes                = attributes[:subscriber] = {}
      subscriber_attributes[:company_id]   = company_id   if company_id

      attributes
    end
  end
end
