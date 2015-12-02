require 'spec_helper'

describe GetServicePeriod do
  let(:creds) { credentials.merge!(uuid: '3a30ad79-50b4-4324-a7a2-ea8700102e25') }

  let(:get_service_period) do
    described_class.new(creds)
  end

  let(:get_service_period_request) do
    File.read('./spec/fixtures/requests/get_service_period/request.json')
  end

  describe 'get_service_period_request_json' do
    subject { get_service_period.view }
    it      { should eq get_service_period_request }
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
