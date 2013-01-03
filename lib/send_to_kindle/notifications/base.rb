require 'active_support/inflector'
require 'mail'
require 'terminal-notifier'

module SendToKindle
  module Notifications
    class Base

      attr_accessor :file_path, :message, :options

      def initialize(file_path, message, options={})
        self.message   = message
        self.file_path = file_path
        self.options   = options

        add_mediums
      end

      def send
      end

    private

      def add_mediums
        self.options[:mediums].each do |medium, enabled|
          next unless enabled

          path = "send_to_kindle/notifications/mediums/#{medium}"
          require path
          self.extend(path.camelize.constantize)
        end
      end

    end
  end
end
