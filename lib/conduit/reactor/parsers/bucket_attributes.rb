require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  module BucketAttributes
    def self.included(receiver)
      receiver.attribute :bucket_id do
        object_path('buckets/0/id')
      end

      receiver.attribute :created_at do
        object_path('buckets/0/created_at')
      end

      receiver.attribute :current_balance do
        object_path('buckets/0/current_balance')
      end

      receiver.attribute :starting_balance do
        object_path('buckets/0/starting_balance')
      end

      receiver.attribute :state do
        object_path('buckets/0/state')
      end

      receiver.attribute :overflow do
        object_path('buckets/0/overflow')
      end

      receiver.attribute :services do
        object_path('buckets/0/services')
      end

      receiver.attribute :add_on do
        object_path('buckets/0/add_on')
      end

      receiver.attribute :plan do
        object_path('buckets/0/plan')
      end

      receiver.attribute :unlimited do
        object_path('buckets/0/unlimited')
      end

      receiver.attribute :carrier_service_ids do
        object_path('buckets/0/carrier_service_ids')
      end

    end

    def response_content?
      !object_path('buckets').nil?
    end

  end
end
