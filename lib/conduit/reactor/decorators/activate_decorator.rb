require_relative 'base'

module Conduit::Reactor::Decorators
  class ActivateDecorator < Base
    def_delegator  :port_attributes, :mdn
    def_delegator  :port_attributes, :carrier_account,      :port_carrier_account
    def_delegator  :port_attributes, :carrier_password,     :port_carrier_password
    def_delegator  :port_attributes, :ssn,                  :port_ssn
    def_delegator  :port_attributes, :first_name,           :port_first_name
    def_delegator  :port_attributes, :last_name,            :port_last_name
    def_delegator  :port_attributes, :city,                 :port_city
    def_delegator  :port_attributes, :state,                :port_state
    def_delegator  :port_attributes, :zip,                  :port_zip
    def_delegator  :port_attributes, :address1,             :port_address1
    def_delegator  :port_attributes, :address2,             :port_address2
    def_delegator  :port_attributes, :external_port_number, :external_port_number

    def port_mdn
      mdn.to_s.gsub(/\D/, '')
    end

    private

    def port_info?
      __getobj__.respond_to?(:port_info)
    end

    def port_attributes
      port_info? ? OpenStruct.new(port_info) : nil
    end
  end
end
