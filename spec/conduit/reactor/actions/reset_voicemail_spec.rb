require 'spec_helper'

describe ResetVoicemail do
  let(:line_uuid) { '98d32801-85ec-4bf4-aa0e-95cc6c143d89' }
  let(:reset_voicemail_attributes) { credentials.merge(line_uuid: line_uuid, callback_url: callback_url) }

  let(:reset_voicemail) do
    described_class.new(reset_voicemail_attributes)
  end

  let(:reset_voicemail_request) do
    File.read('./spec/fixtures/requests/reset_voicemail/request.json')
  end

  describe 'reset_voicemail_json' do
    subject { reset_voicemail.view }
    it { should eq reset_voicemail_request }
  end

  describe '#remote_url' do
    subject { reset_voicemail }

    its(:remote_url) { should eql "http://www.atom-reactor.dev/lines/#{line_uuid}/reset_voicemail"}
  end


  it_should_behave_like 'parser in progress success response' do
    subject do
      described_class.new(
        reset_voicemail_attributes.merge(mock_status: :success, http_status: 202)).perform.parser
    end

    its(:http_status) { should eql 202 }
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        reset_voicemail_attributes.merge(mock_status: :failure)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        reset_voicemail_attributes.merge(mock_status: :error)).perform.parser
    end
  end

end
