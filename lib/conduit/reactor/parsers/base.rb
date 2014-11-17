require 'multi_json'

module Conduit::Driver::Reactor
  module Parser
    class Base < Conduit::Core::Parser
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
          'success'
        elsif ise? || !response_content?
          'error'
        else
          'failure'
        end
      end

      def response_errors
        return unexpected_response_hash['errors'] if ise?

        object_path('errors') || []
      end

      def response_content?
        raise(StandardError, 'Please implement response_content? in your parser')
      end

      private

      attr_reader :json

      def ise?
        status = object_path('status')

        !status.nil? && status.to_i == 500 ? true : false
      end

      def unexpected_response_hash
        { 'errors' => { 'base' => 'Unexpected response from server.' } }
      end

      # An xpath-like accessor for retrieving
      # data elements from the json.
      #
      # e.g.,
      #   object_path('meta/paginaton/total_count')
      #     => Total number of records from the paginaton
      #
      #   object_path('lines/0/mdn')
      #     => MDN attribute of the first element in
      #     the lines array
      def object_path(path)
        data = json

        path.split('/').map do |element|
          key = element.match(/\A\d+\Z/) ? element.to_i : element
          data = data[key]
        end.last
      end
    end
  end
end
