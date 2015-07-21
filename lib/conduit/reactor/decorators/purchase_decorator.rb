require_relative 'base'

module Conduit::Reactor::Decorators
  class PurchaseDecorator < Base
    def purchase_attributes
      attributes = {}
      attributes[:callback_url] = callback_url if callback_url

      purchase_attributes = attributes[:purchase] = {}
      purchase_attributes[:plan_ids] = plan_ids
      purchase_attributes[:mdn]     = mdn

      attributes
    end
  end
end
