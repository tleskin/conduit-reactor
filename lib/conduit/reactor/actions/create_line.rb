require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class CreateLine < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :subscriber_id, :carrier_id, :service_details
    optional_attributes :mdn, :nid, :iccid
    http_method         :post
  end
end
