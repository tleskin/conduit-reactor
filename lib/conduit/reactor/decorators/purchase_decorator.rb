require_relative 'base'

module Conduit::Reactor::Decorators
  class PurchaseDecorator < Base
    def purchase_attributes
      attributes = {}
      attributes[:auth_token]   = token        if token
      attributes[:callback_url] = callback_url if callback_url

      purchase_attributes = attributes[:purchase] = {}
      purchase_attributes[:plan_id] = plan_id
      purchase_attributes[:mdn]     = mdn

      attributes
    end
  end
end
