require 'spec_helper'

describe ChangeDevice do
  subject do
    described_class.new \
      credentials.merge(mdn: '5555555555', nid: '99000204057111', host_override: 'www.hello-labs.com')
  end

  context 'when providing a override host' do
    its(:remote_url) { should =~ /hello-labs/ }
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        credentials.merge(mdn: '5555555555', nid: '99000204057111', mock_status: :success)).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        credentials.merge(mdn: '5555555555', nid: '99000204057111', mock_status: :failure)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        credentials.merge(mdn: '5555555555', nid: '99000204057111', mock_status: :error)).perform.parser
    end
  end  
end