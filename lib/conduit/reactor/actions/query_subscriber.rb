require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QuerySubscriber < Conduit::Driver::Reactor::Base
    url_route           '/subscribers'
    required_attributes :subscriber_id

    def perform_request
      response = request(
        body:   view,
        method: :get,
        path:   "/subscribers/#{@options[:subscriber_id]}"
      )

      parser   = parser_class.new(response.body)
      Conduit::ApiResponse.new(raw_response: response, parser: parser)
    end    
  end
end
