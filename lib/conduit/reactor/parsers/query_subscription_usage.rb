require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class QuerySubscriptionUsage::Parser < Parser::Base
    attribute :mdn
    attribute :from_date
    attribute :to_date
    attribute :usage_type
    attribute :total_calls
    attribute :total_airtime_usage
    attribute :are_more_call_details
    attribute :call_detail_list do
      object_path('call_detail_list').map do |record|
        {
          airtime_minutes: record['airtime_minutes'],
          activity_unit: record['activity_unit'],
          call_date: record['call_date'],
          call_time: record['call_time'],
          calling_number: record['calling_number'],
          called_destination: record['called_destination'],
          called_number: record['called_number'],
          home_call: record['home_call'],
          nai: record['nai'],
          rpdr_service_code: record['rpdr_service_code'],
          sid: record['sid'],
          usage_quantity: record['usage_quantity'],
          usage_source_ind: record['usage_source_ind'],
          content_type_name: record['content_type_name'],
          content_detailed_description: record['content_detailed_description']
        }
      end
    end

    def response_content?
      !! object_path('mdn')
    end
  end
end
