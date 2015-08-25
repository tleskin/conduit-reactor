require 'spec_helper'

describe QueryDeviceInfo do

  let(:query_device_attributes) do
    credentials.merge(carrier_id: 1, device_serial_number: '111222333444555667',
                      iccid: '89011200000403604860', mock_status: :success)
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
          :availability_type_code                => "1",
          :availability_type_message             => "Available",
          :esn_meid_hex                          => "99000250022761",
          :device_type                           => "U",
          :device_type_description               => "Removable transceiver / USIM transceiver",
          :equipment_freq_type_code              => "B",
          :equipment_freq_type_description       => "ADVANCED WORLD-MODE PRL",
          :freq_mode                             => "C",
          :freq_mode_description                 => "CDMA",
          :iccid                                 => "89011200000403604860",
          :uicc_imsi                             => "310120018850976",
          :uicc_sku                              => "CZ2101LTR",
          :manufacturer_name                     => "LG",
          :model_name                            => "BST LG870 TRANSCEIVER SGL",
          :model_number                          => "LG870AB1",
          :not_available_reason_code             => "0",
          :uicc_availability_code                => "1",
          :uicc_availability_message             => "Available",
          :uicc_compatibility                    => "Y",
          :uicc_compatibility_description        => "Transceiver and UICC are compatible together",
          :uicc_not_available_reason_code        => "0",
          :uicc_type                             => "U",
          :uicc_type_description                 => "Removable USIM",
          :validation_message                    => "Device is valid and cleared for use",
          :poc_swap_indicator                    => "true",
          :poc_swap_indicator_description        => "Device eligible for phone ownership change",
          :device_fed_met_indicator              => "true",
          :device_fed_met_indicator_description  => "FED is in the past, financial eligibility on the device has been met.",
          :activation_status                     => "N",
          :activation_status_description         => "Device is deactivated"
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
