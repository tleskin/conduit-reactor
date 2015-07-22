require 'erb'
require 'tilt'

module Conduit::Reactor::RequestMocker
  class Base
    FIXTURE_PREFIX = "#{File.dirname(__FILE__)}/fixtures/responses".freeze

    def initialize(base, options = nil)
      @base = base
      @options = options
      @mock_status = options[:mock_status].to_sym || :success
      @http_status = options[:http_status] || 200
    end

    def mock
      Excon.defaults[:mock] = true
      Excon.stub({}, {:body => response, :status => @http_status})
    end

    def unmock
      Excon.defaults[:mock] = false
      Excon.stubs.clear
    end

    def with_mocking
      mock and yield.tap { unmock }
    end

    private

    def render_response
      Tilt::ERBTemplate.new(fixture).render(@base.view_context)
    end

    def action_name
      ActiveSupport::Inflector.demodulize(self.class.name).underscore
    end

    def fixture
      FIXTURE_PREFIX + "/#{action_name}/#{@mock_status}.json.erb"
    end

    def response
      if response_statuses.include?(@mock_status)
        return error_response if @mock_status == :error
        render_response
      else
        raise(ArgumentError, "Mock status must be one of the following: #{response_statuses.join(', ')}")
      end
    end

    def response_statuses
      %i(success failure error)
    end

    def error_response
      '{"status": 500, "error": "Internal Service Error"}'
    end
  end
end
