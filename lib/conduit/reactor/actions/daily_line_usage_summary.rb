require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class DailyLineUsageSummary < Conduit::Driver::Reactor::Base
    url_route           '/usages/daily_line_usages_summary'
    required_attributes :date
    http_method         :get
  end
end
