require_relative 'base'

module Conduit::Reactor::Decorators
  class ActivateDecorator < Base
    def_delegator  :port_attributes, :mdn
    def_delegator  :port_attributes, :carrier_account,  :port_carrier_account
    def_delegator  :port_attributes, :carrier_password, :port_carrier_password
    def_delegator  :port_attributes, :ssn,              :port_ssn
    def_delegator  :port_attributes, :first_name,       :port_first_name
    def_delegator  :port_attributes, :last_name,        :port_last_name
    def_delegator  :port_attributes, :city,             :port_city
    def_delegator  :port_attributes, :state,            :port_state
    def_delegator  :port_attributes, :zip,              :port_zip
    def_delegator  :port_attributes, :address1,         :port_address1
    def_delegator  :port_attributes, :address2,         :port_address2

    def port_mdn
      mdn.to_s.gsub(/\D/, '')
    end

    def request_data
      request = {
        auth_token: token,
        callback_url: callback_url
      }

      request.merge!(line_data) unless line_id
      request
    end

    private

    def port_info?
      __getobj__.respond_to?(:port_info)
    end

    def port_attributes
      port_info? ? OpenStruct.new(port_info) : nil
    end

    def line_data
      line = {
        line: {
          nid: nid,
          carrier_name: operator_name,
          service_details: {
            msid: msid,
            msl: msl,
            csa: csa,
            zip: zip
          }
        }
      }
      
      line[:line].merge!(number_port_data) if port_info
      line
    end

    def number_port_data
      {
        number_port_attributes: {
          mdn:                port_mdn,
          first_name:         port_first_name,
          last_name:          port_last_name,
          carrier_account:    port_carrier_account,
          carrier_password:   port_carrier_password,
          ssn:                port_ssn,
          address1:           port_address1,
          address2:           port_address2
        }
      }
    end
  end
end
