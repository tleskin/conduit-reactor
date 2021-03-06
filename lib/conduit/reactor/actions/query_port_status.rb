require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QueryPortStatus < Conduit::Driver::Reactor::Base
    url_route           '/number_ports'
    required_attributes :mdn    
    http_method         :post

    def remote_url
      super + number_port_url
    end

    private

    def number_port_url
      "/#{@options[:mdn]}/query_status"
    end
  end
end
