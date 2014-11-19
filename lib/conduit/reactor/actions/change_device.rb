require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class ChangeDevice < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :line_id, :nid
    http_method         :post

    def remote_url
      super + "/#{@options[:line_id]}/change_device"
    end
  end
end
