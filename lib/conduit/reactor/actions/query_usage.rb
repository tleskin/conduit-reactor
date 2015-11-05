require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QueryUsage < Conduit::Driver::Reactor::Base
    url_route           '/usages'
    required_attributes :mdn
    optional_attributes :starting_at, :ending_at, :service_period_uuid, :service_type
    http_method         :get


    def initialize(options = {})
      super
      unless (@options[:starting_at] && @options[:ending_at]) || @options[:service_period_uuid]
        raise ArgumentError, "You need to supply either a service_period_uuid, or starting_at and ending_at"
      end
    end
  end
end
