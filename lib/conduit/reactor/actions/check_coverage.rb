require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class CheckCoverage < Conduit::Driver::Reactor::Base
    url_route           '/carriers'
    required_attributes :carrier_code
    optional_attributes :city, :state, :zip, :zip4
    http_method         :post

    def remote_url
      super + check_coverage_url
    end

    private

    def check_coverage_url
      "/#{@options[:carrier_code]}/check_coverage"
    end
  end
end
