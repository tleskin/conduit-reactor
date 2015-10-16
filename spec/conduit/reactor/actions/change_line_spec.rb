require 'spec_helper'

describe ChangeLine do
  let(:line_uuid) { '98d32801-85ec-4bf4-aa0e-95cc6c143d89' }
  let(:creds) do
    credentials.merge(line_uuid: line_uuid,
      permanent_carrier_service_ids: [1],
      recurring_plan_ids: [2],
      opted_out_carrier_service_ids: [3],
      carrier_plan_id: 4)
  end

  let(:change_line) do
    described_class.new(creds)
  end

  let(:change_line_request) do
    File.read('./spec/fixtures/requests/change_line/request.json')
  end

  describe 'change_line_request_json' do
    subject { change_line.view }
    it      { should eq change_line_request }
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
