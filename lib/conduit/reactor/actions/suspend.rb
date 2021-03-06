require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Suspend < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    optional_attributes :callback_url, :line_uuid, :mdn
    http_method         :post

    def remote_url
      super + "/#{@options[:line_uuid]}/suspend"
    end
  end
end
