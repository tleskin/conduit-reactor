require 'spec_helper'

describe CreateLine do
  let(:creds) { credentials.merge!(subscriber_uuid: "edfd286c-316f-40ad-bb8a-7f8f889bc6ca", company_uuid: "adfd286c-316f-40ad-bb8a-7f8f889bc6ca", carrier_id: 1, nid: '12345678', csa: '11111', zip: '33414') }

  let(:create_line) do
    described_class.new(creds)
  end

  let(:create_line_request) do
    File.read('./spec/fixtures/requests/create_line/request.json')
  end

  describe 'create_line_request_json' do
    subject { create_line.view }
    it      { should eq create_line_request.chomp }
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
