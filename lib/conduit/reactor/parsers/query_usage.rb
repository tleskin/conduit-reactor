require_relative 'base'

module Conduit::Driver::Reactor
  class QueryUsage::Parser < Parser::Base
    USAGE_RECORD_ATTRIBUTES = %i(id service_type sourcefile bill_number create_time 
      usage_time from_number to_number data_octets location call_seconds)
      
    def response_content?
      !object_path('items').nil?
    end

    attribute :items do
      object_path('items').map do |record|
        attr = USAGE_RECORD_ATTRIBUTES.map { |attr| record[attr.to_s] }
        UsageRecord.new(*attr)
      end
    end

    class UsageRecord < Struct.new(*USAGE_RECORD_ATTRIBUTES)
      def used_at
        return if usage_time.nil?
        Time.at(usage_time.to_i)
      end

      def created_at
        return if create_time.nil?
        Time.at(create_time.to_i)
      end
    end
  end
end
