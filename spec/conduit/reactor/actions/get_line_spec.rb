require 'spec_helper'

describe GetLine do
  let(:creds) { credentials.merge!(mdn: '5555555555') }

  let(:get_line) do
    described_class.new(creds)
  end

  let(:get_line_request) do
    File.read('./spec/fixtures/requests/get_line/request.json')
  end

  describe 'get_line_request_json' do
    subject { get_line.view }
    it      { should eq get_line_request }
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