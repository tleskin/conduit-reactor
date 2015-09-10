require_relative 'base'

module Conduit::Reactor::Decorators
  class DailyLineUsageSummaryDecorator < Base
    def daily_line_usage_summary_attributes
      {}.tap do |h|
        h[:date] = date if date
      end
    end
  end
end
