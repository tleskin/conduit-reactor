require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  module PortAttributes
    def self.included(receiver)
      receiver.attribute :number_port_id do
        object_path('number_ports/0/id')
      end

      receiver.attribute :mdn do
        object_path('number_ports/0/mdn')
      end

      receiver.attribute :status do
        object_path('number_ports/0/status')
      end

      receiver.attribute :line_id do
        object_path('number_ports/0/line_id')
      end

      receiver.attribute :external_port_number do
        object_path('number_ports/0/external_port_number')
      end

      receiver.attribute :first_name do
        object_path('number_ports/0/first_name')
      end

      receiver.attribute :last_name do
        object_path('number_ports/0/last_name')
      end

      receiver.attribute :address1 do
        object_path('number_ports/0/address1')
      end

      receiver.attribute :address2 do
        object_path('number_ports/0/address2')
      end

      receiver.attribute :city do
        object_path('number_ports/0/city')
      end

      receiver.attribute :state do
        object_path('number_ports/0/state')
      end

      receiver.attribute :zip do
        object_path('number_ports/0/zip')
      end

      receiver.attribute :zip_plus_4 do
        object_path('number_ports/0/zip_plus_4')
      end

      receiver.attribute :carrier_account do
        object_path('number_ports/0/carrier_account')
      end

      receiver.attribute :carrier_password do
        object_path('number_ports/0/carrier_password')
      end   

      receiver.attribute :ssn do
        object_path('number_ports/0/ssn')
      end

      receiver.attribute :created_at do
        object_path('number_ports/0/created_at')
      end   

      receiver.attribute :updated_at do
        object_path('number_ports/0/updated_at')
      end
    end

    def response_content?
      !object_path('number_ports').nil?
    end
  end
end