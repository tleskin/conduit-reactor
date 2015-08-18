require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class ChangeDevice < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :nid
    optional_attributes :callback_url, :iccid, :mdn, :line_uuid
    http_method         :post

    def remote_url
      super + "/#{@options[:line_uuid]}/change_device"
    end
  end
end
