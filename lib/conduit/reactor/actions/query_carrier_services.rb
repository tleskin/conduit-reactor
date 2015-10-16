require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QueryCarrierServices < Conduit::Driver::Reactor::Base
    url_route           '/carrier_services'
    optional_attributes :carrier_id
    http_method         :get
  end
end
