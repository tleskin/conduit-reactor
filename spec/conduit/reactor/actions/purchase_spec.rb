require 'spec_helper'

describe Purchase do
  let(:purchase_attributes) do
    credentials.merge(mdn: '5555555555', plan_id: 1, callback_url: callback_url, mock_status: :success)
  end

  let(:purchase) do
    described_class.new(purchase_attributes)
  end

  let(:purchase_request) do
    File.read('./spec/fixtures/requests/purchase/request.json')
  end

  describe 'purchase_request_json' do
    subject { purchase.view }
    it      { should eq purchase_request }
  end

  subject do
    described_class.new(purchase_attributes.merge(host_override: 'www.hello-labs.com'))
  end

  context 'when providing a override host' do
    its(:remote_url) { should =~ /hello-labs/ }
  end

  context 'when submitting the request' do
    let(:serializable_hash) { {} }

    subject do
      purchase.perform.parser
    end

    its(:serializable_hash) { should eq serializable_hash }
  end

  it_should_behave_like 'parser in progress success response' do
    subject do
      described_class.new(
        purchase_attributes.merge(mock_status: :success)).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        purchase_attributes.merge(mock_status: :failure)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        purchase_attributes.merge(mock_status: :error)).perform.parser
    end
  end
end