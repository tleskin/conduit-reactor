require_relative 'base'

module Conduit::Reactor::Decorators
  class GetLineDecorator < Base
    def get_line_attributes
      attributes = {}
      attributes[:by_uuid]     = line_uuid if line_uuid

      attributes
    end
  end
end
