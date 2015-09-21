require 'spec_helper'

describe ValidatePort do
  let(:options) do
    credentials.merge(mdn: '6198926828', mock_status: :success)
  end

  context 'when submitting the request' do
    let(:serializable_hash) do
      {
        :csa => "NEVSDG619",
        :desired_due_date => "2015-09-10T14:19:21",
        :mdn => "6198926828",
        :message => "PTN is eligible for Porting In",
        :number_portability_direction_indicator => "A",
        :number_portability_direction_indicator_description => "A",
        :old_service_provider => "T-MOBILE USA, INC.",
        :port_id => "9999",
        :port_in_status => "A",
        :port_in_status_text => "test",
        :status => "2",
      }
    end

    subject do
      described_class.new(options).perform.parser
    end

    its(:serializable_hash) { should eq serializable_hash }
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        options.merge(mock_status: :success)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        options.merge(mock_status: :error)).perform.parser
    end
  end

end
