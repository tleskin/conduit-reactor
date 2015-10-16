require_relative 'base'

module Conduit::Reactor::Decorators
  class ChangeLineDecorator < Base
    def change_line_attributes
      attributes = {}

      attributes[:permanent_carrier_service_ids] = permanent_carrier_service_ids if permanent_carrier_service_ids
      attributes[:recurring_plan_ids] = recurring_plan_ids if recurring_plan_ids
      attributes[:opted_out_carrier_service_ids] = opted_out_carrier_service_ids if opted_out_carrier_service_ids
      attributes[:carrier_plan_id] = carrier_plan_id if carrier_plan_id

      {line: attributes}
    end
  end
end
