require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class CancelBucket < Conduit::Driver::Reactor::Base
    url_route           '/buckets'
    required_attributes :bucket_id
    optional_attributes :cancel_recurring_plan
    http_method         :post

    def remote_url
      super + cancel_bucket_url
    end

    private

    def cancel_bucket_url
      "/#{@options[:bucket_id]}/cancel"
    end
  end
end
