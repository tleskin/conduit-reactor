require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class GetSubscriber::Parser < Parser::Base
    attribute :subscriber_id do
      object_path('subscribers/0/id')
    end

    attribute :uuid do
      object_path('subscribers/0/uuid')
    end

    attribute :company_id do
      object_path('subscribers/0/company_id')
    end

    attribute :created_at do
      object_path('subscribers/0/created_at')
    end

    attribute :updated_at do
      object_path('subscribers/0/updated_at')
    end

    def response_content?
      !object_path('subscribers').nil?
    end
  end
end
