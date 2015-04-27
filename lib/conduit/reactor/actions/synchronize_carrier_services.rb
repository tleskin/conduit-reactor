require 'conduit/reactor/actions/base'
module Conduit::Driver::Reactor
  class SynchronizeCarrierServices < Conduit::Driver::Reactor::Base
    required_attributes :mdn
    optional_attributes :callback_url

    def url_route
      "/lines/#{@options[:mdn]}/synchronize_carrier_services"
    end

    def perform_request
      response = request(path: "/lines/#{@options[:mdn]}/synchronize_carrier_services",
        body: view, method: :get)

      parser   = parser_class.new(response.body, response.status)
      Conduit::ApiResponse.new(raw_response: response, parser: parser)
    end
  end
end
