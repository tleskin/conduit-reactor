require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class GetServicePeriod < Conduit::Driver::Reactor::Base
    url_route           '/service_periods'
    required_attributes :uuid

    def remote_url
      super + "/#{@options[:uuid]}"
    end
  end
end
