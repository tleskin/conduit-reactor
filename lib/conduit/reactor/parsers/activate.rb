require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/line_attributes'

module Conduit::Driver::Reactor
  class Activate::Parser < Parser::Base
    include LineAttributes

    def response_content?
      !object_path('lines').nil? || !object_path('number_ports').nil?
    end

    def in_progress?
      mdn = object_path('lines/0/mdn')
      (mdn.nil? || mdn.empty?)
    end

    def result
      # for number port..if its in progress and we have a number port response
      # we need to send back acknowledged
      #
      # NOTE: this should be temporary, reactor need to sending back its own response instead of always looking for a number_port obj
      return 'acknowledged' if !object_path('number_ports').nil? && in_progress?
      super
    end
  end
end
