require_relative 'base'

module Conduit::Driver::Reactor
  class ValidatePort::Parser < Parser::Base

    def response_content?
      object_path('mdn'.freeze)
    end

    attribute :mdn
    attribute :status
    attribute :message
    attribute :old_service_provider
    attribute :csa
    attribute :desired_due_date
    attribute :number_portability_direction_indicator
    attribute :number_portability_direction_indicator_description
    attribute :port_in_status
    attribute :port_in_status_text
    attribute :port_id

  end
end
