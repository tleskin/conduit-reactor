require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class QueryDeviceInfo::Parser < Parser::Base
    attribute :model_name
    attribute :model_number
    attribute :manufacturer_name
    attribute :lte_iccid
    attribute :lte_imsi

    def response_content?
      !@json.nil?
    end
  end
end
