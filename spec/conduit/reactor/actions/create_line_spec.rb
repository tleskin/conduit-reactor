require 'spec_helper'

describe CreateLine do
  subject do
    described_class.new \
      credentials.merge(host_override: 'www.hello-labs.com', subscriber_id: 1, carrier_id: 1, nid: '12345678',
          service_details: { csa: '11111', zip: '33414' })
  end

  context 'when providing a override host' do
    its(:remote_url) { should =~ /hello-labs/ }
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        credentials.merge(mock_status: :success, subscriber_id: 1, carrier_id: 1, nid: '12345678',
          service_details: { csa: '11111', zip: '33414' })).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        credentials.merge(mock_status: :failure, subscriber_id: 1, carrier_id: 1, nid: '12345678',
          service_details: { csa: '11111', zip: '33414' })).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        credentials.merge(mock_status: :error, subscriber_id: 1, carrier_id: 1, nid: '12345678',
          service_details: { csa: '11111', zip: '33414' })).perform.parser
    end
  end
end