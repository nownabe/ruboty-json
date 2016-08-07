# frozen_string_literal: true

require "json"

module Ruboty
  module Brains
    class Json < Base
      env :JSON_PATH, "JSON path (default: ruboty.json)", optional: true
      env :JSON_SAVE_INTERVAL, "Interval sec to save data to JSON file (default: 5)", optional: true

      def initialize
        super
        @thread = Thread.new { sync }
        @thread.abort_on_exception = true
      end

      def data
        @data ||= fetch
      end

      private

      def fetch
        if File.exist?(path)
          JSON.parse(File.read(path))
        else
          {}
        end
      end

      def interval
        ENV["JSON_SAVE_INTERVAL"]&.to_i || 5
      end

      def path
        ENV["JSON_PATH"] || "ruboty.json"
      end

      def save
        File.write(path, data.to_json)
      end

      def sync
        loop do
          wait
          save
        end
      end

      def wait
        sleep(interval)
      end
    end
  end
end
