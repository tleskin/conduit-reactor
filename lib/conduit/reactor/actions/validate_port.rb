require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class ValidatePort < Conduit::Driver::Reactor::Base
    url_route           '/carriers'
    required_attributes :mdn
    http_method         :get

    def remote_url
      super + validate_port_url
    end

    private

    def validate_port_url
      "/#{@options[:carrier_id]}/validate_port"
    end
  end
end
