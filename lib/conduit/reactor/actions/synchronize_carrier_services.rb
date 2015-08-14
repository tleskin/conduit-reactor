require 'conduit/reactor/actions/base'
module Conduit::Driver::Reactor
  class SynchronizeCarrierServices < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :line_uuid
    optional_attributes :callback_url
    http_method         :post

    def remote_url
      super + synchronize_carrier_services_url
    end

    private

    def synchronize_carrier_services_url
      "/#{@options[:line_uuid]}/synchronize_carrier_services"
    end
  end
end
