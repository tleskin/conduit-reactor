require 'spec_helper'

describe Conduit::Driver::Reactor::QueryUsage::Parser do
  subject { described_class.new(json) }
  let(:json) { MultiJson.dump(usage) }
  let(:usage) do
    { items: usage_records }
  end
  let(:usage_records) { [] }

  context 'when there are no usage records' do
    its(:items) { should be_empty }
  end

  context 'with a data record' do
    let(:usage_records) do
      [{
        id: '12345',
        service_type: 'data',
        sourcefile: '/path/to/sample.DAT',
        bill_number: '5612223811',
        create_time: Time.now.to_i,
        usage_time: Time.now.to_i,
        data_octets: 128,
        codes: ['roaming']
      }]
    end

    its(:items) { should_not be_empty }

    it 'should populate data attributes' do
      record = subject.items.first
      expect(record.id).to eql '12345'
      expect(record.service_type).to eql 'data'
      expect(record.sourcefile).to eql '/path/to/sample.DAT'
      expect(record.bill_number).to eql '5612223811'
      expect(record.created_at).to be_a_kind_of(Time)
      expect(record.used_at).to be_a_kind_of(Time)
      expect(record.data_octets).to eql 128
      expect(record.codes).to eql ['roaming']
    end

    it 'should not populate other attributes' do
      record = subject.items.first
      expect(record.originating_location).to be_nil
      expect(record.terminating_location).to be_nil
      expect(record.to_number).to be_nil
      expect(record.from_number).to be_nil
      expect(record.call_seconds).to be_nil
    end
  end

  context 'with a text (SMS) record' do
    let(:usage_records) do
      [{
        id: '12345',
        service_type: 'data',
        sourcefile:  '/path/to/sample.DAT',
        bill_number: '5612223811',
        create_time: Time.now.to_i,
        usage_time:  Time.now.to_i,
        from_number: '5612223811',
        to_number:   '5612223812',
      }]
    end

    its(:items) { should_not be_empty }

    it 'should populate data attributes' do
      record = subject.items.first
      expect(record.id).to eql '12345'
      expect(record.service_type).to eql 'data'
      expect(record.sourcefile).to eql '/path/to/sample.DAT'
      expect(record.bill_number).to eql '5612223811'
      expect(record.created_at).to be_a_kind_of(Time)
      expect(record.used_at).to be_a_kind_of(Time)
      expect(record.from_number).to eql '5612223811'
      expect(record.to_number).to eql '5612223812'
    end

    it 'should not populate other attributes' do
      record = subject.items.first
      expect(record.data_octets).to be_nil
      expect(record.originating_location).to be_nil
      expect(record.terminating_location).to be_nil
      expect(record.call_seconds).to be_nil
    end
  end

  context 'with a voice record' do
    let(:usage_records) do
      [{
        id: '12345',
        service_type: 'data',
        sourcefile:  '/path/to/sample.DAT',
        bill_number: '5612223811',
        create_time: Time.now.to_i,
        usage_time:  Time.now.to_i,
        from_number: '5612223811',
        to_number:   '5612223812',
        call_seconds: 300,
        originating_location: 'PALM BEACH GARDENS, FL'
      }]
    end

    its(:items) { should_not be_empty }

    it 'should populate data attributes' do
      record = subject.items.first
      expect(record.id).to eql '12345'
      expect(record.service_type).to eql 'data'
      expect(record.sourcefile).to eql '/path/to/sample.DAT'
      expect(record.bill_number).to eql '5612223811'
      expect(record.created_at).to be_a_kind_of(Time)
      expect(record.used_at).to be_a_kind_of(Time)
      expect(record.from_number).to eql '5612223811'
      expect(record.to_number).to eql '5612223812'
      expect(record.originating_location).to eql 'PALM BEACH GARDENS, FL'
      expect(record.terminating_location).to be_nil
      expect(record.call_seconds).to eql 300
    end

    it 'should not populate other attributes' do
      record = subject.items.first
      expect(record.data_octets).to be_nil
    end
  end
end
