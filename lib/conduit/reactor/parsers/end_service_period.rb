require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/subscriber_attributes'

module Conduit::Driver::Reactor
  class EndServicePeriod::Parser < Parser::Base
    include SubscriberAttributes
  end
end
