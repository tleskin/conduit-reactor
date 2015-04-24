require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class ResetVoicemail < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :mdn
    optional_attributes :callback_url
    http_method         :post

    def perform_request
      response = request(path: "/lines/#{@options[:mdn]}/reset_voicemail",
        body: view, method: :get)

      parser   = parser_class.new(response.body)
      Conduit::ApiResponse.new(raw_response: response, parser: parser)
    end
  end
end
