require 'spec_helper'

describe CancelPort do
  let(:cancel_attributes) do
    credentials.merge(mdn: '5555555555', callback_url: callback_url, mock_status: :success)
  end

  let(:cancel_port) do
    described_class.new(cancel_attributes)
  end

  let(:cancel_port_request) do
    File.read('./spec/fixtures/requests/cancel_port/request.json')
  end

  describe 'cancel_port_request_json' do
    subject { cancel_port.view }
    it      { should eq cancel_port_request }
  end

  subject do
    described_class.new(cancel_attributes.merge(host_override: 'www.hello-labs.com'))
  end

  context 'when providing a override host' do
    its(:remote_url) { should =~ /hello-labs/ }
  end

  context 'when submitting the request' do
    let(:serializable_hash) do
      {
        :address1             => "123 Test St",
        :address2             => nil,
        :carrier_account      => "123456",
        :carrier_password     => "password",
        :city                 => nil,
        :created_at           => "2015-01-07T19:07:13.211Z",
        :first_name           => "testy",
        :last_name            => "tester",
        :external_port_number => "123",
        :line_id              => 1,
        :mdn                  => "5555555555",
        :number_port_id       => 1,
        :ssn                  => "123456789",
        :status               => "cancelling",
        :updated_at           => "2015-01-07T19:07:37.451Z",
        :state                => nil,
        :zip                  => nil,
        :zip_plus_4           => nil,
      }
    end

    subject do
      cancel_port.perform.parser
    end

    its(:serializable_hash) { should eq serializable_hash }
  end

  it_should_behave_like 'parser in progress success response' do
    subject do
      described_class.new(
        cancel_attributes.merge(mock_status: :success)).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        cancel_attributes.merge(mock_status: :failure)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        cancel_attributes.merge(mock_status: :error)).perform.parser
    end
  end
end
