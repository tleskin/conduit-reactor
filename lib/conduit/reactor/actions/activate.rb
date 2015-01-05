require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Activate < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    optional_attributes :line_id, :nid, :msid, :msl, :csa, :zip, :operator_name, :port_info, :callback_url
    http_method         :post

    def remote_url
      super + activate_url
    end

    private

    def activate_url
      @options.key?(:line_id) ? "/#{@options[:line_id]}/activate" : '/activate'
    end
  end
end
