require_relative 'base'

module Conduit::Reactor::Decorators
  class ChangeDeviceDecorator < Base
    def change_device_attributes
      attributes         = auth_token_callback_attributes
      attributes[:nid]   = nid if nid
      attributes[:iccid] = iccid if iccid

      attributes
    end
  end
end
