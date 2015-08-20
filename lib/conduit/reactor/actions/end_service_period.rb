require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class EndServicePeriod < Conduit::Driver::Reactor::Base
    url_route           '/subscribers'
    required_attributes :subscriber_uuid
    optional_attributes :end_at
    http_method         :post

    def remote_url
      super + end_service_period_path
    end

    private

    def end_service_period_path
      "/#{@options[:subscriber_uuid]}/end_service_period"
    end
  end
end
