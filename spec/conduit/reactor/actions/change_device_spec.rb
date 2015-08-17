require 'spec_helper'

describe ChangeDevice do
  let(:line_uuid) { '98d32801-85ec-4bf4-aa0e-95cc6c143d89' }
  let(:creds) do
   credentials.merge(line_uuid: line_uuid, nid: '99000204057111',
    callback_url: callback_url)
 end

  let(:change_device) do
    described_class.new(creds)
  end

  let(:change_device_request) do
    File.read('./spec/fixtures/requests/change_device/request.json')
  end

  let(:change_device_request_with_iccid) do
    File.read('./spec/fixtures/requests/change_device/request_with_iccid.json')
  end

  describe 'change_device_request_json' do
    subject { change_device.view }
    it      { should eq change_device_request }
  end

  describe 'change device request with iccid' do
    let(:creds) do
      credentials.merge!(line_uuid: line_uuid, nid: '99000204057111',
        iccid: '310120123456789', callback_url: callback_url)
    end

    subject { change_device.view }
    it      { should eq change_device_request_with_iccid.strip }
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
