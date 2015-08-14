require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class CreateLine < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    optional_attributes :mdn, :nid, :iccid, :carrier_id, :carrier_name,
                        :subscriber_uuid, :company_uuid, :msid, :msl, :csa, :zip, :uuid
    http_method         :post
  end
end
