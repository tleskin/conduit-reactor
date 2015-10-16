require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class ChangeLine < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    required_attributes  :line_uuid
    optional_attributes :permanent_carrier_service_ids, :recurring_plan_ids, :opted_out_carrier_service_ids, :carrier_plan_id
    http_method         :put

    def remote_url
      super + change_line_url
    end

    private

    def change_line_url
      "/#{@options[:line_uuid]}"
    end
  end
end
