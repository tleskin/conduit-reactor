require 'spec_helper'

describe Restore do
  let(:creds) { credentials.merge(mdn: '5555555555', callback_url: callback_url) }

  let(:restore) do
    described_class.new(creds)
  end

  let(:restore_request) do
    File.read('./spec/fixtures/requests/restore/request.json')
  end

  describe 'restore_request_json' do
    subject { restore.view }
    it      { should eq restore_request }
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