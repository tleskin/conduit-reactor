require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class CancelPort::Parser < Parser::Base
    attribute :number_port_id do
      object_path('number_ports/0/id')
    end

    attribute :mdn do
      object_path('number_ports/0/mdn')
    end

    attribute :state do
      object_path('number_ports/0/state')
    end

    attribute :line_id do
      object_path('number_ports/0/line_id')
    end

    attribute :first_name do
      object_path('number_ports/0/first_name')
    end

    attribute :last_name do
      object_path('number_ports/0/last_name')
    end

    attribute :address1 do
      object_path('number_ports/0/address1')
    end

    attribute :address2 do
      object_path('number_ports/0/address2')
    end

    attribute :city do
      object_path('number_ports/0/city')
    end

    attribute :state do
      object_path('number_ports/0/state')
    end

    attribute :zip do
      object_path('number_ports/0/zip')
    end

    attribute :zip_plus_4 do
      object_path('number_ports/0/zip_plus_4')
    end

    attribute :carrier_account do
      object_path('number_ports/0/carrier_account')
    end

    attribute :carrier_password do
      object_path('number_ports/0/carrier_password')
    end   

    attribute :ssn do
      object_path('number_ports/0/ssn')
    end

    attribute :created_at do
      object_path('number_ports/0/created_at')
    end   

    attribute :updated_at do
      object_path('number_ports/0/updated_at')
    end

    def response_content?
      !object_path('number_ports').nil?
    end
  end
end