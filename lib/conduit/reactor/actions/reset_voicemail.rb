require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class ResetVoicemail < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    optional_attributes :callback_url, :line_uuid, :mdn
    http_method         :post

    def remote_url
      super + reset_voicemail_url
    end

    private

    def reset_voicemail_url
      "/#{@options[:line_uuid]}/reset_voicemail"
    end
  end
end
