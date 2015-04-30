require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QueryUsage < Conduit::Driver::Reactor::Base
    url_route           '/usages'
    required_attributes :mdn, :starting_at, :ending_at
    http_method         :get
  end
end
