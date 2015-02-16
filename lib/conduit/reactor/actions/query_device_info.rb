require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QueryDeviceInfo < Conduit::Driver::Reactor::Base
    url_route           '/carriers'
    required_attributes :carrier_id, :device_serial_number
    http_method         :post

    def remote_url
      super + query_device_url
    end

    private

    def query_device_url
      "/#{@options[:carrier_id]}/query_device_info"
    end
  end
end
