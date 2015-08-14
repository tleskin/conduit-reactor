require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class GetLine < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :line_uuid
    http_method         :get
  end
end
