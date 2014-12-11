require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Suspend < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :mdn
    optional_attributes :callback_url
    http_method         :post

    def remote_url
      super + "/#{@options[:mdn]}/suspend"
    end
  end
end
