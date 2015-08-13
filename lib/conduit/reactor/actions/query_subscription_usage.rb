require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QuerySubscriptionUsage < Conduit::Driver::Reactor::Base
    url_route           "/carriers"
    required_attributes :carrier_id
    optional_attributes :meid, :mdn, :from_date, :to_date, :usage_type
    http_method         :post

    def remote_url
      super + "/#{@options[:carrier_id]}/query_subscription_usage"
    end
  end
end
