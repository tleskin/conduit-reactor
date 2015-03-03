require_relative 'base'

module Conduit::Reactor::Decorators
  class CheckCoverageDecorator < Base
    def check_coverage_attributes
      attributes = {}
      attributes[:auth_token] = token   if token
      attributes[:city]       = city    if city
      attributes[:state]      = state   if state
      attributes[:zip]        = zip     if zip
      attributes[:zip4]       = zip4    if zip4

      attributes
    end
  end
end
