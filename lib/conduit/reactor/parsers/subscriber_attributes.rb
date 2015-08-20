require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  module SubscriberAttributes
    def self.included(receiver)
      receiver.attribute :subscriber_id do
        object_path('subscribers/0/id')
      end

      receiver.attribute :uuid do
        object_path('subscribers/0/uuid')
      end

      receiver.attribute :company_id do
        object_path('subscribers/0/company_id')
      end

      receiver.attribute :created_at do
        object_path('subscribers/0/created_at')
      end

      receiver.attribute :updated_at do
        object_path('subscribers/0/updated_at')
      end
    end

    def response_content?
      !object_path('subscribers').nil?
    end

  end
end
