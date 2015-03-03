require 'spec_helper'

describe Suspend do
  let(:creds) { credentials.merge(mdn: '5555555555', callback_url: callback_url) }

  let(:suspend) do
    described_class.new(creds)
  end

  let(:suspend_request) do
    File.read('./spec/fixtures/requests/suspend/request.json')
  end

  describe 'suspend_request_json' do
    subject { suspend.view }
    it      { should eq suspend_request }
  end

  subject do
    described_class.new \
      creds.merge(host_override: 'www.hello-labs.com')
  end

  context 'when providing a override host' do
    its(:remote_url) { should =~ /hello-labs/ }
  end

  it_should_behave_like 'parser in progress success response' do
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