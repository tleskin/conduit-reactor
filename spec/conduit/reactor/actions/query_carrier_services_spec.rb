require 'spec_helper'

describe QueryCarrierServices do
  let(:creds) do
    credentials.merge(carrier_id: 1)
  end

  let(:query_carrier_services) do
    described_class.new(creds)
  end

  let(:query_carrier_services_request) do
    File.read('./spec/fixtures/requests/query_carrier_services/request.json')
  end

  describe 'query_carrier_services_request_json' do
    subject { query_carrier_services.view }
    it      { should eq query_carrier_services_request }
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
