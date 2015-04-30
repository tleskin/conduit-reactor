require_relative 'base'

module Conduit::Driver::Reactor
  class UsageRecord < Struct.new(:id, :service_type, :sourcefile, :bill_number
    :create_time, :usage_time, :from_number, :to_number, :data_octets, :location,
    :call_seconds)

    def used_at
      return if usage_time.nil?
      DateTime.at(usage_time.to_i)
    end

    def created_at
      return if create_time.nil?
      DateTime.at(create_time.to_i)
    end
  end
end
