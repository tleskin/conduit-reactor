require_relative 'base'

module Conduit::Reactor::Decorators
  class CreateLineDecorator < Base
    def create_line_attributes
      attributes = {}
      attributes[:auth_token] = token if token

      line_attributes                 = attributes[:line] = {}
      line_attributes[:mdn]           = mdn           if mdn
      line_attributes[:iccid]         = iccid         if iccid
      line_attributes[:carrier_id]    = carrier_id    if carrier_id
      line_attributes[:carrier_name]  = carrier_name  if carrier_name
      line_attributes[:subscriber_uuid] = subscriber_uuid if subscriber_uuid

      service_detail_attributes        = line_attributes[:service_details] = {}
      service_detail_attributes[:msid] = msid if msid
      service_detail_attributes[:msl]  = msl  if msl
      service_detail_attributes[:csa]  = csa  if csa
      service_detail_attributes[:zip]  = zip  if zip

      attributes
    end
  end
end
