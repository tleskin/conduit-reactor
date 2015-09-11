require 'spec_helper'

describe ValidatePort do
  let(:options) do
    credentials.merge(mdn: '6198926828')
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
