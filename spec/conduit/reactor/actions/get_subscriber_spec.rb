require 'spec_helper'

describe GetSubscriber do
  let(:creds) { credentials.merge!(subscriber_id: '1') }

  let(:get_subscriber) do
    described_class.new(creds)
  end

  let(:get_subscriber_request) do
    File.read('./spec/fixtures/requests/get_subscriber/request.json')
  end

  describe 'get_subscriber_request_json' do
    subject { get_subscriber.view }
    it      { should eq get_subscriber_request }
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