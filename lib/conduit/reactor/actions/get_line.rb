require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class GetLine < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    optional_attributes :line_uuid, :mdn
    http_method         :get
  end
end
