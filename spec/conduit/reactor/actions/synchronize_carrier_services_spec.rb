require 'spec_helper'

describe SynchronizeCarrierServices do
  let(:line_uuid) { '98d32801-85ec-4bf4-aa0e-95cc6c143d89' }
  let(:synchronize_carrier_services_attributes) { credentials.merge(line_uuid: line_uuid, callback_url: callback_url) }

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

  describe '#remote_url' do
    subject { synchronize_carrier_services }

    its(:remote_url) { should eql "http://www.atom-reactor.dev/lines/#{line_uuid}/synchronize_carrier_services"}
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
