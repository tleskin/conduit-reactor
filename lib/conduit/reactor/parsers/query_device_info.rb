require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class QueryDeviceInfo::Parser < Parser::Base
    attribute :model_name
    attribute :model_number
    attribute :manufacturer_name
    attribute :iccid
    attribute :imsi
    attribute :uicc_type    
    attribute :phone_ownership_code
    attribute :availability_type_code
    attribute :availability_type_message
    attribute :uicc_compatibility
    attribute :uicc_availability_code
    attribute :uicc_availability_message
    attribute :device_type
    attribute :freq_mode
    attribute :equipment_freq_type_code
    attribute :uicc_not_available_reason_code
    attribute :uicc_not_available_reason_message
    attribute :not_available_reason_code
    attribute :not_available_reason_message
    attribute :device_serial_number
    attribute :validation_message

    def response_content?
      !@json.nil?
    end
  end
end
