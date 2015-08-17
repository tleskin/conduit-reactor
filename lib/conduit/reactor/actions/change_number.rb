require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class ChangeNumber < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :line_uuid
    optional_attributes :callback_url
    http_method         :post

    def remote_url
      super + "/#{@options[:line_uuid]}/change_number"
    end
  end
end
