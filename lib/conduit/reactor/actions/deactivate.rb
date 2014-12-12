require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Deactivate < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :mdn
    optional_attributes :callback_url
    http_method         :post

    def remote_url
      super + "/#{@options[:mdn]}/deactivate"
    end
  end
end
