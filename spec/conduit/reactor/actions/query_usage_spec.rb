require 'spec_helper'

describe QueryUsage do
  let(:options) do
    credentials.merge(mdn: '5612223811', starting_at: Time.mktime(2015, 4, 1),
      ending_at: Time.mktime(2015, 5, 1))
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        options.merge(mock_status: :success)).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        options.merge(mock_status: :failure)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        options.merge(mock_status: :error)).perform.parser
    end
  end

end
