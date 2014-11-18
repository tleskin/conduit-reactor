require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class CreateSubscriber < Conduit::Driver::Reactor::Base
    url_route           '/subscribers'
    required_attributes :company_id
    http_method         :post
  end
end
