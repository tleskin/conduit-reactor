module Conduit
  module Reactor
    module Configuration
      class << self
        attr_accessor :api_host

        def configure(&block)
          yield self
        end
      end

      self.api_host = 'http://www.atom-reactor.dev'
    end
  end
end
