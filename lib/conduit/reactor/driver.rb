module Conduit
  module Driver
    module Reactor
      extend Conduit::Core::Driver

      required_credentials :token
      optional_attributes  :mock_status, :host_override

      action :activate
      action :create_subscriber
      action :create_line
      action :query_line
      action :query_subscriber
      action :query_subscription
    end
  end
end
