require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class ChangeDevice < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :mdn, :nid
    optional_attributes :callback_url
    http_method         :post

    def remote_url
      super + "/#{@options[:mdn]}/change_device"
    end
  end
end
