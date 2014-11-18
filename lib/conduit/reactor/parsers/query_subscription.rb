require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class QuerySubscription::Parser < Parser::Base

    attribute :status do
      object_path('status')
    end

    attribute :reseller_partner_id do
      object_path('reseller_partner_id')
    end

    attribute :mdn do
      object_path('mdn')
    end

    attribute :msid do
      object_path('msid')
    end

    attribute :csa do
      object_path('csa')
    end

    attribute :nid_dec do
      object_path('esn_dec')
    end

    attribute :nid_hex do
      object_path('esn_hex')
    end

    attribute :imsi do
      object_path('imsi')
    end

    attribute :icc_id do
      object_path('icc_id')
    end

    attribute :activated_at do
      object_path('activated_at')
    end

    attribute :plan_code do
      object_path('plan_code')
    end

    attribute :plan_description do
      object_path('plan_description')
    end

    attribute :plan_effective_date do
      object_path('plan_effective_date')
    end

    attribute :nai do
      object_path('nai')
    end

    attribute :nai_effective_date do
      object_path('nai_effective_date')
    end

    attribute :service_records do
      object_path('service_records')
    end

    def response_content?
      !object_path('mdn').nil?
    end
  end
end
