require 'spec_helper'

describe Activate do
  let(:port_attributes) do
    credentials.merge(nid: '111222333444555667', zip: '33413', carrier_name: 'Sprint',
                        port_info: { mdn: '5555555555', first_name: 'testy', last_name: 'tester', carrier_account: '123456', zip: '33410',
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

  it_should_behave_like 'parser in progress success response' do
    subject do
      described_class.new(port_attributes).perform.parser
    end
  end
end