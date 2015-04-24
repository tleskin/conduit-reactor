require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class ResetVoicemail::Parser < Parser::Base

    def response_content?
      true # TODO this this the correct thing to do here?
    end
  end
end
