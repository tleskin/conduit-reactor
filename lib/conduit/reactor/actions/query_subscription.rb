require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QuerySubscription < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    optional_attributes :service_period_uuid, :mdn, :line_uuid
    http_method         :get

    def remote_url
      super + query_subscription_url
    end

    private

    def query_subscription_url
      "/#{@options[:line_uuid]}/query_subscription" +
          (@options[:service_period_uuid] ?
           "?service_period_uuid=#{@options[:service_period_uuid]}" : "")
    end
  end
end
