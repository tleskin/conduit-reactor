module Conduit
  module Driver
    module Reactor
      extend Conduit::Core::Driver

      required_credentials :token
      optional_attributes  :mock_status, :host_override

      action :query_line
    end
  end
end
