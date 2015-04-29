require_relative 'base'

module Conduit::Reactor::Decorators
  class ModifyPortDecorator < Base
    def modify_port_attributes
      attributes                                      = auth_token_callback_attributes
      number_port_attributes                          = attributes[:number_port] = {}
      number_port_attributes[:mdn]                    = mdn                   if mdn
      number_port_attributes[:first_name]             = first_name            if first_name
      number_port_attributes[:last_name]              = last_name             if last_name
      number_port_attributes[:business_name]          = business_name         if business_name
      number_port_attributes[:carrier_account]        = carrier_account       if carrier_account
      number_port_attributes[:carrier_password]       = carrier_password      if carrier_password
      number_port_attributes[:ssn]                    = ssn                   if ssn
      number_port_attributes[:authorized_by]          = authorized_by         if authorized_by
      number_port_attributes[:address1]               = address1              if address1
      number_port_attributes[:address2]               = address2              if address2
      number_port_attributes[:city]                   = city                  if city
      number_port_attributes[:state]                  = state                 if state
      number_port_attributes[:zip]                    = zip                   if zip

      attributes
    end
  end
end
