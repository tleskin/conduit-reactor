require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/line_attributes'

module Conduit::Driver::Reactor
  class Restore::Parser < Parser::Base
    include LineAttributes

    def in_progress?
      status = object_path('lines/0/state')
      (status && status.downcase != 'active')
    end
  end
end
