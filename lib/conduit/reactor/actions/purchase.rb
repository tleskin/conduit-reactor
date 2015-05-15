require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Purchase < Conduit::Driver::Reactor::Base
    url_route           '/purchases'
    required_attributes :mdn, :plan_id
    optional_attributes :callback_url
    http_method         :post
  end
end
