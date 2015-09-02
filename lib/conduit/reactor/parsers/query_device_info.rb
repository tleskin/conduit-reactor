require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class QueryDeviceInfo::Parser < Parser::Base
    attribute :model_name
    attribute :model_number
    attribute :manufacturer_name
    attribute :iccid
    attribute :uicc_imsi
    attribute :uicc_sku
    attribute :availability_type_code
    attribute :availability_type_message
    attribute :uicc_type
    attribute :uicc_type_description
    attribute :uicc_compatibility
    attribute :uicc_compatibility_description
    attribute :uicc_availability_code
    attribute :uicc_availability_message
    attribute :device_type
    attribute :device_type_description
    attribute :freq_mode
    attribute :freq_mode_description
    attribute :equipment_freq_type_code
    attribute :equipment_freq_type_description
    attribute :uicc_not_available_reason_code
    attribute :uicc_not_available_reason_message
    attribute :not_available_reason_code
    attribute :esn_meid_hex
    attribute :validation_message
    attribute :poc_swap_indicator
    attribute :poc_swap_indicator_description
    attribute :device_fed_met_indicator
    attribute :device_fed_met_indicator_description
    attribute :activation_status
    attribute :activation_status_description

    def response_content?
      !@json.nil?
    end
  end
end
