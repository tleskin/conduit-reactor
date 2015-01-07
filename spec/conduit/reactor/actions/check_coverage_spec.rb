require 'spec_helper'

describe CheckCoverage do

  let(:check_coverage_city_state_attributes) do
    credentials.merge(city: 'WPB', state: 'FL', carrier_id: 1, mock_status: :success)
  end

  let(:check_coverage_zip_attributes) do
    credentials.merge(zip: '11111', zip4: '1111', carrier_id: 1, mock_status: :success)
  end

  let(:check_coverage_city_state) do
    described_class.new(check_coverage_city_state_attributes)
  end

  let(:check_coverage_zip) do
    described_class.new(check_coverage_zip_attributes)
  end

  let(:check_coverage_city_state_request) do
    File.read('./spec/fixtures/requests/check_coverage/city_state_request.json')
  end

  let(:check_coverage_zip_request) do
    File.read('./spec/fixtures/requests/check_coverage/zip_request.json')
  end

  describe 'check_coverage_city_state_json' do
    subject { check_coverage_city_state.view }
    it      { should eq check_coverage_city_state_request }
  end

  describe 'check_coverage_zip_json' do
    subject { check_coverage_zip.view }
    it      { should eq check_coverage_zip_request }
  end

  subject do
    described_class.new(check_coverage_city_state_attributes.merge!(host_override: 'www.hello-labs.com'))
  end

  context 'when providing a override host' do
    its(:remote_url) { should =~ /hello-labs/ }
  end

  context 'when submitting a city state request' do
    let(:serializable_hash) do 
      {
        :affiliate_name        => "Sprint PCS",
        :city                  => "WPB",
        :confidence            => "G3",
        :coverage_quality_cdma => "Good Coverage",
        :coverage_quality_iden => "No Coverage",
        :csa                   => "MIAWPB561",
        :evdo                  => "true",
        :hybrid                => "false",
        :iden                  => "false",
        :is3g                  => "true",
        :latitude              => "26.705279",
        :longitude             => "-80.036669",
        :npa                   => "561",
        :nxx                   => "206",
        :state                 => "FL",
        :zip                   => nil,
        :zip4                  => nil,
      }
    end

    subject do
      check_coverage_city_state.perform.parser
    end

    its(:serializable_hash) { should eq serializable_hash }
  end

  context 'when submitting a zip request' do
    let(:serializable_hash) do 
      {
        :affiliate_name        => "Sprint PCS",
        :city                  => nil,
        :confidence            => "Z1",
        :coverage_quality_cdma => "Best Coverage",
        :coverage_quality_iden => "No Coverage",
        :csa                   => "MIAWPB561",
        :evdo                  => "true",
        :hybrid                => "false",
        :iden                  => "false",
        :is3g                  => "true",
        :latitude              => "26.66",
        :longitude             => "-80.1257",
        :npa                   => "561",
        :nxx                   => "242",
        :state                 => nil,
        :zip                   => "11111",
        :zip4                  => "1111",
      }
    end

    subject do
      check_coverage_zip.perform.parser
    end

    its(:serializable_hash) { should eq serializable_hash }
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        check_coverage_city_state_attributes).perform.parser
    end
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        check_coverage_zip_attributes).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        check_coverage_city_state_attributes.merge!(mock_status: :failure)).perform.parser
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        check_coverage_city_state_attributes.merge!(mock_status: :error)).perform.parser
    end
  end
end