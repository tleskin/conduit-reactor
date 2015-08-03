require_relative 'base'

module Conduit::Reactor::Decorators
  class QueryDeviceInfoDecorator < Base
    def query_device_attributes
      attributes = {}
      attributes[:device_serial_number] = device_serial_number if device_serial_number
      attributes[:iccid]                = iccid                if iccid

      attributes
    end
  end
end
