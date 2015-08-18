require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Deactivate < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    optional_attributes :callback_url, :line_uuid, :mdn
    http_method         :post

    def remote_url
      super + "/#{@options[:line_uuid]}/deactivate"
    end
  end
end
