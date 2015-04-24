require_relative 'base'

module Conduit::Reactor::Decorators
  class ResetVoicemailDecorator < Base

    def reset_voicemail_attributes
      auth_token_callback_attributes
    end

  end
end
