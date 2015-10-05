require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QueryUsage < Conduit::Driver::Reactor::Base
    url_route           '/usages'
    required_attributes :mdn, :starting_at, :ending_at
    optional_attributes :service_type
    http_method         :get
  end
end
