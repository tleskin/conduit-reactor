require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class CancelPort < Conduit::Driver::Reactor::Base
    url_route           '/number_ports'
    required_attributes :line_uuid
    optional_attributes :callback_url
    http_method         :post

    def remote_url
      super + number_port_url
    end

    private

    def number_port_url
      "/#{@options[:line_uuid]}/cancel"
    end
  end
end
