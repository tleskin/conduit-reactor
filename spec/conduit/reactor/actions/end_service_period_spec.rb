require 'spec_helper'

describe EndServicePeriod do
  let(:end_at) { Time.parse('2015-01-01 12:00:00 UTC')}
  let(:creds) { credentials.merge!(subscriber_uuid: '0b613f43-6ded-4cdd-880f-8fc35a8ed7d0', end_at: end_at) }

  let(:end_service_period) do
    described_class.new(creds)
  end

  let(:end_service_period_request) do
    File.read('./spec/fixtures/requests/end_service_period/request.json').chomp
  end

  describe 'end_service_period_request_json' do
    subject { end_service_period.view }
    it      { should eq end_service_period_request }
  end

  subject do
    described_class.new \
      creds.merge(host_override: 'www.hello-labs.com')
  end

  context 'when providing a override host' do
    its(:remote_url) { should =~ /hello-labs/ }
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        creds.merge(mock_status: :success)).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        creds.merge(mock_status: :failure)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        creds.merge(mock_status: :error)).perform.parser
    end
  end
end
