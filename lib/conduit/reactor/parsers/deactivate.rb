require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/line_attributes'

module Conduit::Driver::Reactor
  class Deactivate::Parser < Parser::Base
    include LineAttributes

    def in_progress?
      status = object_path('lines/0/state')
      (status && status.downcase != 'deactivated')
    end
  end
end
