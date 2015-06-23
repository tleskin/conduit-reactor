require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Hotline < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :mdn
    http_method         :post

    def remote_url
      super + hotline_url
    end

    private

    def hotline_url
      "/#{@options[:mdn]}/hotline"
    end
  end
end
