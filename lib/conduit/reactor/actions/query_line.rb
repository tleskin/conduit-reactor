require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class QueryLine < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :mdn
    http_method         :get
  end
end
