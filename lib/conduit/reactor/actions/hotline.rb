require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Hotline < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :line_uuid
    http_method         :post

    def remote_url
      super + hotline_url
    end

    private

    def hotline_url
      "/#{@options[:line_uuid]}/hotline"
    end
  end
end
