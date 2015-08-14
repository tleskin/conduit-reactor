require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Purchase < Conduit::Driver::Reactor::Base
    url_route           '/purchases'
    required_attributes :line_uuid, :plan_ids
    optional_attributes :callback_url
    http_method         :post
  end
end
