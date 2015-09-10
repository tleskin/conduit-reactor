require 'spec_helper'

describe DailyLineUsageSummary do
  let(:options) do
    credentials.merge(date: Time.mktime(2015, 4, 1))
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
