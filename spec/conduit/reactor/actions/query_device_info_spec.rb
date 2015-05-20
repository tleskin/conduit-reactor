require 'spec_helper'

describe QueryDeviceInfo do

  let(:query_device_attributes) do
    credentials.merge(carrier_id: 1, device_serial_number: '111222333444555667', mock_status: :success)
  end

  let(:query_device) do
    described_class.new(query_device_attributes)
  end

  let(:query_device_request) do
    File.read('./spec/fixtures/requests/query_device_info/request.json')
  end

  describe 'query_device_info_json' do
    subject { query_device.view }
    it      { should eq query_device_request }
  end

  subject do
    described_class.new(query_device_attributes.merge!(host_override: 'www.hello-labs.com'))
  end

  context 'when providing a override host' do
    its(:remote_url) { should =~ /hello-labs/ }
  end

  context 'when submitting the request' do
    let(:serializable_hash) do
      {
        :iccid                             => "89011200000403604860",
        :imsi                              => "310120040360486",
        :manufacturer_name                 => "SAMSUNG",
        :model_name                        => "SAM L720T BLK XCVR SGL",
        :model_number                      => "SPHL720TB1",
        :availability_type_code            => "1",
        :availability_type_message         => "Available",
        :device_serial_number              => "99000470382044",
        :device_type                       => "U",
        :equipment_freq_type_code          => "H",
        :freq_mode                         => "C",
        :not_available_reason_code         => "0",
        :not_available_reason_message      => nil,
        :phone_ownership_code              => nil,
        :uicc_availability_code            => "1",
        :uicc_availability_message         => "Available",
        :uicc_compatibility                => "Y",
        :uicc_not_available_reason_code    => "0",
        :uicc_not_available_reason_message => nil,
        :uicc_type                         => "U",
        :validation_message                => "Device is valid and cleared for use"
      }
    end

    subject do
      query_device.perform.parser
    end

    its(:serializable_hash) { should eq serializable_hash }
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        query_device_attributes.merge!(mock_status: :success)).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        query_device_attributes.merge!(mock_status: :failure)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        query_device_attributes.merge!(mock_status: :error)).perform.parser
    end
  end
end