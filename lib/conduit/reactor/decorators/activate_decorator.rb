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

    def activate_attributes
      attributes = {}
      attributes[:auth_token]   = token        if token
      attributes[:callback_url] = callback_url if callback_url

      attributes
    end

    def activate_new_line_attributes
      attributes = activate_attributes

      line_attributes                = attributes[:line] = {}
      line_attributes[:nid]          = nid          if nid
      line_attributes[:iccid]        = iccid        if iccid
      line_attributes[:carrier_name] = carrier_name if carrier_name
      line_attributes[:carrier_id]   = carrier_id   if carrier_id
      line_attributes[:plan_id]      = plan_id      if plan_id

      service_detail_attributes        = line_attributes[:service_details] = {}
      service_detail_attributes[:msid] = msid if msid
      service_detail_attributes[:msl]  = msl  if msl
      service_detail_attributes[:csa]  = csa  if csa
      service_detail_attributes[:zip]  = zip  if zip

      attributes
    end

    def activate_new_line_with_port_attributes
      attributes = activate_new_line_attributes

      line_attributes                               = attributes[:line]
      number_port_attributes                        = line_attributes[:number_port_attributes] = {}
      number_port_attributes[:mdn]                  = port_mdn              if port_mdn
      number_port_attributes[:ssn]                  = port_ssn              if port_ssn
      number_port_attributes[:first_name]           = port_first_name       if port_first_name
      number_port_attributes[:last_name]            = port_last_name        if port_last_name
      number_port_attributes[:address1]             = port_address1         if port_address1
      number_port_attributes[:address2]             = port_address2         if port_address2
      number_port_attributes[:state]                = port_state            if port_state
      number_port_attributes[:city]                 = port_city             if port_city
      number_port_attributes[:zip]                  = port_zip              if port_zip
      number_port_attributes[:carrier_account]      = port_carrier_account  if port_carrier_account
      number_port_attributes[:carrier_password]     = port_carrier_password if port_carrier_password
      number_port_attributes[:external_port_number] = external_port_number  if external_port_number

      attributes
    end

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
