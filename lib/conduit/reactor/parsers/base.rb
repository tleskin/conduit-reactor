require 'multi_json'

module Conduit::Driver::Reactor
  module Parser
    class Base < Conduit::Core::Parser
      attr_reader :json

      def self.attribute(attr_name, &block)
        block ||= lambda do
          object_path attr_name
        end
        super(attr_name, &block)
      end

      def initialize(json)
        @json    = MultiJson.load(json)
        @success = true
      rescue MultiJson::ParseError
        @json = unexpected_response_hash
        @success = false
      end

      def response_status
        @success &&= response_errors.empty?

        if @success
          in_progress? ? 'submitted' : 'success'
        elsif ise? || !response_content?
          'error'
        else
          'failure'
        end
      end

      def response_errors
        return unexpected_response_hash if ise?
        object_path('errors') || failure || {}
      end

      def response_content?
        raise(StandardError, 'Please implement response_content? in your parser')
      end

      def in_progress?
        object_path('result') == 'submitted'
      end

      def failure
        failure_msg = { 'errors' => { 'base' => ['Request failed.'] } }
        return failure_msg if object_path('result') == 'failure'
      end

      private

      def ise?
        status = object_path('status')
        status.to_i == 500
      end

      def unexpected_response_hash
        { 'errors' => { 'base' => ['Unexpected response from server.'] } }
      end

      def object_path(path)
        data = json

        value = path.to_s.split('/').map do |element|
          key = element.match(/\A\d+\Z/) ? element.to_i : element
          data = data.nil? ? nil : data[key]
        end.last
      end
    end
  end
end
