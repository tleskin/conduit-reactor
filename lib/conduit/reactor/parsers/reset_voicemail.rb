require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class ResetVoicemail::Parser < Parser::Base

    def response_content?
      # Anything that's not a 500 could have a body that we can parse.
      # JSON parse failures are handled in the base parser constructor
      http_status != 500
    end
  end
end
