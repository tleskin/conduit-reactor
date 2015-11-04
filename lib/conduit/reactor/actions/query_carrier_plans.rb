require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QueryCarrierPlans < Conduit::Driver::Reactor::Base
    url_route           '/carrier_plans'
    optional_attributes :carrier_id
    http_method         :get
  end
end
