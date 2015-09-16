require_relative 'base'

module Conduit::Reactor::Decorators
  class ValidatePortDecorator < Base
    def validate_port_attributes
      {}.tap do |h|
        h[:mdn] = mdn if mdn
      end
    end
  end
end
