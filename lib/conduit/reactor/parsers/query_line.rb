require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class QueryLine::Parser < Parser::Base
    attribute :line_id do
      object_path('lines/0/id')
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

    def response_content?
      !object_path('lines').nil?
    end
  end
end
