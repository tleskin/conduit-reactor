require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/line_attributes'

module Conduit::Driver::Reactor
  class Activate::Parser < Parser::Base
    include LineAttributes

    def in_progress?
      mdn = object_path('lines/0/mdn')
      (mdn.nil? || mdn.empty?)
    end
  end
end
