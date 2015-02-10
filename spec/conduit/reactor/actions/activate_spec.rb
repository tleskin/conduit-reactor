require 'spec_helper'

describe Activate do
  let(:port_attributes) do
    credentials.merge(nid: '111222333444555667', zip: '33413', carrier_name: 'Sprint',
                        port_info: { mdn: '5555555555', first_name: 'testy', last_name: 'tester', carrier_account: '123456',
                                    external_port_number: '123', carrier_password: 'password', ssn: '123456789', address1: '123 Test ST' }, mock_status: :success)
  end

  let(:activate_port) do
    described_class.new(port_attributes)
  end

  let(:activate_port_request) do
    File.read('./spec/fixtures/requests/activate/activate_port.json')
  end

  describe 'activate_port_request_json' do
    subject { activate_port.view }
    it      { should eq activate_port_request }
  end

  let(:activate_line_id_attributes) do
    credentials.merge(line_id: 1, mock_status: :success)
  end

  let(:activate_line_id) do
    described_class.new(activate_line_id_attributes)
  end

  let(:activate_line_id_request) do
    File.read('./spec/fixtures/requests/activate/activate_line_id.json')
  end

  describe 'activate_line_id_request_json' do
    subject { activate_line_id.view }
    it      { should eq activate_line_id_request }
  end

  let(:activate_attributes_with_codes) do
    credentials.merge(nid: '111222333444555667', zip: '33413', carrier_code: 1, plan_code: 1, mock_status: :success)
  end

  let(:activate_with_codes) do
    described_class.new(activate_attributes_with_codes)
  end

  let(:activate_with_codes_request) do
    File.read('./spec/fixtures/requests/activate/activate_with_codes.json')
  end

  describe 'activate_carrier_code_request_json' do
    subject { activate_with_codes.view }
    it      { should eq activate_with_codes_request }
  end

  let(:activate_attributes) do
    credentials.merge(nid: '111222333444555667', zip: '33413', carrier_name: 'Sprint', mock_status: :success)
  end

  let(:activate) do
    described_class.new(activate_attributes)
  end

  let(:activate_request) do
    File.read('./spec/fixtures/requests/activate/activate.json')
  end

  describe 'activate_request_json' do
    subject { activate.view }
    it      { should eq activate_request }
  end

  subject do
    described_class.new \
      credentials.merge(line_id: 1, host_override: 'www.hello-labs.com')
  end

  context 'when providing a override host' do
    its(:remote_url) { should =~ /hello-labs/ }
  end

  it_should_behave_like 'parser in progress success response' do
    subject do
      described_class.new(
        credentials.merge(line_id: 1, mock_status: :success)).perform.parser
    end
  end

  it_should_behave_like 'parser in progress success response' do
    subject do
      described_class.new(
        credentials.merge(nid: '111222333444555667', zip: '33413', mock_status: :success)).perform.parser
    end
  end

  it_should_behave_like 'parser in progress success response' do
    subject do
      described_class.new(port_attributes).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        credentials.merge(line_id: 1, mock_status: :failure)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        credentials.merge(line_id: 1, mock_status: :error)).perform.parser
    end
  end
end