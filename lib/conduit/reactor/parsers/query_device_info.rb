require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class QueryDeviceInfo::Parser < Parser::Base

    attribute :model_name do
      object_path('model_name')
    end

    attribute :model_number do
      object_path('model_number')
    end

    attribute :manufacturer_name do
      object_path('manufacturer_name')
    end

    attribute :lte_iccid do
      object_path('lte_iccid')
    end

    attribute :lte_imsi do
      object_path('lte_imsi')
    end

    def response_content?
      !@json.nil?
    end
  end
end
