require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class ChangeNumber < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes :line_id
    http_method         :post

    def remote_url
      super + "/#{@options[:line_id]}/change_number"
    end
  end
end
