module Conduit
  module Driver
    module Reactor
      extend Conduit::Core::Driver

      required_credentials :token
      optional_attributes  :mock_status, :host_override

      action :activate
      action :deactivate
      action :suspend
      action :restore
      action :change_device
      action :change_number
      action :create_subscriber
      action :create_line
      action :get_line
      action :get_subscriber
      action :query_subscription
      action :query_device_info
      action :cancel_port
    end
  end
end
