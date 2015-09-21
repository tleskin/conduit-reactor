require 'spec_helper'

describe CancelBucket do
  let(:bucket_id) { '1' }
  let(:cancel_attributes) do
    credentials.merge(bucket_id: bucket_id, cancel_recurring_plan: true, mock_status: :success)
  end

  let(:cancel_bucket) do
    described_class.new(cancel_attributes)
  end

  let(:cancel_request) do
    File.read('./spec/fixtures/requests/cancel_bucket/request.json')
  end

  describe 'cancel_bucket_request_json' do
    subject { cancel_bucket.view }
    it      { should eq cancel_request }
  end

  subject do
    described_class.new(cancel_attributes.merge(host_override: 'www.hello-labs.com'))
  end

  context 'when providing a override host' do
    its(:remote_url) { should =~ /hello-labs/ }
  end

  context 'when submitting the request' do
    let(:serializable_hash) do
      {bucket_id: 1,
        add_on: false,
        carrier_service_ids: [],
        created_at: "2014-11-11T16:11:11.000Z",
        starting_balance: "10.0",
        current_balance: "10.0",
        overflow: false,
        state: "cancelled",
        unlimited: false,
        plan: {"id" => 1, "name" => "Example Plan 1"},
        services: [
          {"service"=>"voice", "remaining_units"=>"1000.0", "used_units"=>"0.0", "used_credit"=>"0.0"},
          {"service"=>"text", "remaining_units"=>"1000.0", "used_units"=>"0.0", "used_credit"=>"0.0"},
          {"service"=>"data", "remaining_units"=>"100.0", "used_units"=>"0.0", "used_credit"=>"0.0"}]
      }
    end

    subject do
      cancel_bucket.perform.parser
    end

    its(:serializable_hash) { should eq serializable_hash }
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        cancel_attributes.merge(mock_status: :success)).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        cancel_attributes.merge(mock_status: :failure)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        cancel_attributes.merge(mock_status: :error)).perform.parser
    end
  end
end
