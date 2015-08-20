require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Hotline < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    optional_attributes :line_uuid, :mdn
    http_method         :post

    def remote_url
      super + hotline_url
    end

    private

    def hotline_url
      "/#{@options[:line_uuid]}/end_service_period"
    end
  end
end
