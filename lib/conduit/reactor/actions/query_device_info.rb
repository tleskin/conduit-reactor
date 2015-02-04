require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QueryDeviceInfo < Conduit::Driver::Reactor::Base
    url_route           '/carriers'
    required_attributes :carrier_code, :nid
    http_method         :post

    def remote_url
      super + query_device_url
    end

    private

    def query_device_url
      "/#{@options[:carrier_code]}/query_device_info"
    end
  end
end
