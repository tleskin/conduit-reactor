require 'conduit/reactor/parsers/base'

module Conduit::Driver::Reactor
  class CheckCoverage::Parser < Parser::Base
    attribute :csa
    attribute :npa
    attribute :nxx
    attribute :city
    attribute :state
    attribute :is3g
    attribute :affiliate_name
    attribute :confidence
    attribute :coverage_quality_cdma
    attribute :coverage_quality_iden
    attribute :evdo
    attribute :hybrid
    attribute :iden
    attribute :latitude
    attribute :longitude
    attribute :zip
    attribute :zip4

    def response_content?
      !@json.nil?
    end
  end
end
