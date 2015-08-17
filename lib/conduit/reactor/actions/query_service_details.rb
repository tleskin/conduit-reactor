require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QueryServiceDetails < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :line_uuid
    optional_attributes :service_period_uuid
    http_method         :get

    def remote_url
      super + query_service_details_url
    end

    private

    def query_service_details_url
      "/#{@options[:line_uuid]}/service_details" +
          (@options[:service_period_uuid] ?
           "?service_period_uuid=#{@options[:service_period_uuid]}" : "")
    end
  end
end
