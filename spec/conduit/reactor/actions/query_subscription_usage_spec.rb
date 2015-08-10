require 'spec_helper'

describe QuerySubscriptionUsage do

  let(:query_subscription_usage_attributes) do
    credentials.merge(carrier_id: 1, device_serial_number: '111222333444555667',
                      iccid: '89011200000403604860', mock_status: :success)
  end

  let(:query_subscription_usage) do
    described_class.new(query_subscription_usage_attributes)
  end

  let(:query_subscription_usage_request) do
    File.read('./spec/fixtures/requests/query_subscription_usage/request.json')
  end

  describe 'query_subscription_usage_json' do
    subject { query_subscription_usage.view }
    it      { should eq query_subscription_usage_request }
  end

  subject do
    described_class.new(query_subscription_usage_attributes.merge!(host_override: 'www.hello-labs.com'))
  end

  context 'when providing a override host' do
    its(:remote_url) { should =~ /hello-labs/ }
  end

  context 'when submitting the request' do
    let(:serializable_hash) do
      {
        mdn: "6192794793",
        from_date: "2015-08-02",
        to_date: "2015-08-02",
        usage_type: "U",
        total_calls: "2",
        total_airtime_usage: "0",
        are_more_call_details: "false",
        call_detail_list: [{
          airtime_minutes: "0", activity_unit: "K", call_date: "2015-08-02", call_time: "08:48:53",
          calling_number: "", called_destination: "", called_number: "", home_call: "",
          nai: "310120042360069", rpdr_service_code: "", sid: "", usage_quantity: "0.34",
          usage_source_ind: "P", content_type_name: "", content_detailed_description: ""
        },
        {
          airtime_minutes: "0", activity_unit: "K", call_date: "2015-08-02", call_time: "14:07:47",
          calling_number: "", called_destination: "", called_number: "", home_call: "",
          nai: "310120042360069", rpdr_service_code: "", sid: "", usage_quantity: "0.27",
          usage_source_ind: "P", content_type_name: "", content_detailed_description: ""
        }]
      }
    end

    subject do
      query_subscription_usage.perform.parser
    end

    its(:serializable_hash) { should eq serializable_hash }
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        query_subscription_usage_attributes.merge!(mock_status: :success)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        query_subscription_usage_attributes.merge!(mock_status: :error)).perform.parser
    end
  end
end
