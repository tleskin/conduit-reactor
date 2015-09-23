require 'conduit/reactor/parsers/base'
require 'conduit/reactor/parsers/bucket_attributes'

module Conduit::Driver::Reactor
  class CancelBucket::Parser < Parser::Base
    include BucketAttributes
  end
end
