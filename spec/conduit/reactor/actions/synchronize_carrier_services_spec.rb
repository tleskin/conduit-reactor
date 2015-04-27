require 'spec_helper'

describe SynchronizeCarrierServices do
  let(:synchronize_carrier_services_attributes) { credentials.merge(mdn: '5555555555', callback_url: callback_url) }

  let(:synchronize_carrier_services) do
    described_class.new(synchronize_carrier_services_attributes)
  end

  let(:synchronize_carrier_services_request) do
    File.read('./spec/fixtures/requests/synchronize_carrier_services/request.json')
  end

  describe 'synchronize_carrier_services_json' do
    subject { synchronize_carrier_services.view }
    it { should eq synchronize_carrier_services_request }
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        synchronize_carrier_services_attributes.merge(mock_status: :success, http_status: 200)).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        synchronize_carrier_services_attributes.merge(mock_status: :failure)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        synchronize_carrier_services_attributes.merge(mock_status: :error)).perform.parser
    end
  end

end
