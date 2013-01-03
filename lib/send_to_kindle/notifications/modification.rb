require 'send_to_kindle/notifications/base'

module SendToKindle
  module Notifications
    class Modification < Base

      def initialize(path, options={})
        super(path, "file updated: #{path}", options)
      end

    end
  end
end
