require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  module LineAttributes
    def self.included(receiver)
      receiver.attribute :line_id do
        object_path('lines/0/id')
      end

      receiver.attribute :line_uuid do
        object_path('lines/0/uuid')
      end

      receiver.attribute :carrier_id do
        object_path('lines/0/carrier_id')
      end

      receiver.attribute :line_status do
        object_path('lines/0/state')
      end

      receiver.attribute :subscriber_uuid do
        object_path('lines/0/subscriber_uuid')
      end

      receiver.attribute :company_uuid do
        object_path('lines/0/company_uuid')
      end

      receiver.attribute :mdn do
        object_path('lines/0/mdn')
      end

      receiver.attribute :nid do
        object_path('lines/0/nid')
      end

      receiver.attribute :nid_type do
        object_path('lines/0/nid_type')
      end

      receiver.attribute :iccid do
        object_path('lines/0/iccid')
      end

      receiver.attribute :service_details do
        object_path('lines/0/service_details')
      end

      receiver.attribute :activated_at do
        object_path('lines/0/activated_at')
      end

      receiver.attribute :created_at do
        object_path('lines/0/created_at')
      end

      receiver.attribute :updated_at do
        object_path('lines/0/updated_at')
      end

      receiver.attribute :number_port_status_update do
        object_path('number_ports/0/status')
      end

      receiver.attribute :external_port_message do
        object_path('number_ports/0/external_port_message')
      end

      receiver.attribute :manual_hotline do
        object_path('lines/0/manual_hotline')
      end

    end

    def response_content?
      !object_path('lines').nil?
    end
  end
end
