require 'conduit/reactor/request_mocker/base'

module Conduit::Reactor::RequestMocker
  class CheckCoverage < Base
    def fixture
      return super if @options[:mock_status] != :success
      FIXTURE_PREFIX + "/check_coverage/#{determine_success_xml}.json.erb"
    end

    def determine_success_xml
      if @options[:city] && @options[:state]
        'successful_city_state_response'
      elsif @options[:zip]
        'successful_zipcode_response'
      else
        raise NoMethodError, "Unable to determine which success response to use, zip or city state." 
      end
    end
  end
end
