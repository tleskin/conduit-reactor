require 'spec_helper'

describe Activate do
  let(:activate_line_id_attributes) do
    credentials.merge(line_id: 1, callback_url: callback_url, mock_status: :success)
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
    credentials.merge(nid: '111222333444555667', zip: '33413', carrier_id: 1, plan_id: 1, mock_status: :success)
  end

  let(:activate_with_codes) do
    described_class.new(activate_attributes_with_codes)
  end

  let(:activate_with_codes_request) do
    File.read('./spec/fixtures/requests/activate/activate_with_codes.json')
  end

  describe 'activate_carrier_id_request_json' do
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

  context 'when submitting the request' do
    let(:serializable_hash) do 
      {
        :activated_at               => nil,
        :carrier_id                 => 2,
        :created_at                 => "2014-10-13T14:25:49.517Z",
        :iccid                      => nil,
        :line_id                    => nil,
        :line_status                => "activating",
        :mdn                        => "",
        :nid                        => "111222333444555667",
        :nid_type                   => "esn",        
        :number_port_status_update  => nil,
        :service_details            => {"csa"=>"CSA", "msl"=>"MSL", "zip"=>"33410", "msid"=>"MSID"},
        :subscriber_id              => 2,
        :updated_at                 => "2014-11-18T21:13:37.779Z",
      }
    end

    subject do
      activate.perform.parser
    end

    its(:serializable_hash) { should eq serializable_hash }
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