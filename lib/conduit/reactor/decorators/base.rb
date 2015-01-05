require 'delegate'
require 'forwardable'

module Conduit::Reactor::Decorators
  class Base < SimpleDelegator
    extend Forwardable
  end
end
