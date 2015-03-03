require 'spec_helper'

describe ChangeNumber do
  let(:creds) { credentials.merge!(mdn: '5555555555', callback_url: callback_url) }

  let(:change_number) do
    described_class.new(creds)
  end

  let(:change_number_request) do
    File.read('./spec/fixtures/requests/change_number/request.json')
  end

  describe 'change_number_request_json' do
    subject { change_number.view }
    it      { should eq change_number_request }
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