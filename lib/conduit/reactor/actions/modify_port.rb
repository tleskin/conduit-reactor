require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class ModifyPort < Conduit::Driver::Reactor::Base
    url_route           '/number_ports'
    required_attributes :mdn
    optional_attributes :callback_url, :mdn, :first_name, :last_name, :business_name, :carrier_account, :carrier_password, :ssn, :authorized_by,
                        :address1, :address2, :city, :state, :zip
    http_method         :post

    def remote_url
      super + number_port_url
    end

    private

    def number_port_url
      "/#{@options[:mdn]}/modify"
    end
  end
end
