module Conduit
  module Driver
    module Reactor
      extend Conduit::Core::Driver

      required_credentials :token
      optional_attributes  :mock_status, :host_override, :carrier_id

      action :purchase
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
      action :query_port_status
      action :query_service_details
      action :query_usage
      action :cancel_port
      action :modify_port
      action :check_coverage
      action :reset_voicemail
      action :synchronize_carrier_services
      action :hotline
      action :end_service_period
    end
  end
end
