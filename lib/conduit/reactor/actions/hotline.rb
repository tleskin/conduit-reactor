require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Hotline < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :mdn

    def perform_request
      response = request(path: "/lines/#{@options[:mdn]}/hotline",
        body: view, method: :post)

      parser   = parser_class.new(response.body)
      Conduit::ApiResponse.new(raw_response: response, parser: parser)
    end
  end
end
