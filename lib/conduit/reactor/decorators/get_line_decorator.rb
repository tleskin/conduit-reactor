require_relative 'base'

module Conduit::Reactor::Decorators
  class GetLineDecorator < Base
    def get_line_attributes
      attributes = {}
      attributes[:auth_token]  = token  if token
      attributes[:by_mdn]      = mdn    if mdn

      attributes
    end
  end
end
