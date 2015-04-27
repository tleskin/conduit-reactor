require 'conduit/reactor/actions/base'
module Conduit::Driver::Reactor
  class SynchronizeCarrierServices < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :mdn
    optional_attributes :callback_url

    def perform_request
      response = request(path: "/lines/#{@options[:mdn]}/synchronize_carrier_services",
        body: view, method: :get)

      parser   = parser_class.new(response.body, response.status)
      Conduit::ApiResponse.new(raw_response: response, parser: parser)
    end
  end
end
