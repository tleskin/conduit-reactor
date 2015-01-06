require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class CheckCoverage::Parser < Parser::Base
    attribute :csa do
      object_path('csa')
    end

    attribute :npa do
      object_path('npa')
    end

    attribute :nxx do
      object_path('nxx')
    end

    attribute :city do
      object_path('city')
    end

    attribute :state do
      object_path('state')
    end

    attribute :is3g do
      object_path('is3g')
    end

    attribute :affiliate_name do
      object_path('affiliate_name')
    end

    attribute :confidence do
      object_path('confidence')
    end

    attribute :coverage_quality_cdma do
      object_path('coverage_quality_cdma')
    end

    attribute :coverage_quality_iden do
      object_path('coverage_quality_iden')
    end

    attribute :evdo do
      object_path('evdo')
    end

    attribute :hybrid do
      object_path('hybrid')
    end

    attribute :iden do
      object_path('iden')
    end   

    attribute :latitude do
      object_path('latitude')
    end

    attribute :longitude do
      object_path('longitude')
    end

    attribute :zip do
      object_path('zip')
    end

    attribute :zip4 do
      object_path('zip4')
    end

    def response_content?
      !@json.nil?
    end
  end
end
