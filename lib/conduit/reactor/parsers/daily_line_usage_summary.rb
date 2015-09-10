require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class DailyLineUsageSummary::Parser < Parser::Base
    attribute :lines do
      object_path('lines')
    end

    def response_content?
      !internal_server_error?
    end
  end
end
