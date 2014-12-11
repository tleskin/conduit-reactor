require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QuerySubscription < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :mdn

    def perform_request
      response = request(path: "/lines/#{@options[:mdn]}/query_subscription",
        body: view, method: :get)

      parser   = parser_class.new(response.body)
      Conduit::ApiResponse.new(raw_response: response, parser: parser)
    end
  end
end
