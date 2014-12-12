require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class Activate::Parser < Parser::Base
    attribute :line_id do
      object_path('lines/0/id')
    end

    attribute :carrier_id do
      object_path('lines/0/carrier_id')
    end

    attribute :line_status do
      object_path('lines/0/state')
    end

    attribute :subscriber_id do
      object_path('lines/0/subscriber_id')
    end

    attribute :mdn do
      object_path('lines/0/mdn')
    end

    attribute :nid do
      object_path('lines/0/nid')
    end

    attribute :nid_type do
      object_path('lines/0/nid_type')
    end

    attribute :service_details do
      object_path('lines/0/service_details')
    end

    attribute :activated_at do
      object_path('lines/0/activated_at')
    end

    attribute :created_at do
      object_path('lines/0/created_at')
    end

    attribute :updated_at do
      object_path('lines/0/updated_at')
    end

    def response_content?
      !object_path('lines').nil?
    end

    def in_progress?
      mdn = object_path('lines/0/mdn')
      (mdn.nil? || mdn.empty?)
    end
  end
end
