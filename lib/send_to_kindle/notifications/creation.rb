require 'send_to_kindle/notifications/base'

module SendToKindle
  module Notifications
    class Creation < Base

      def initialize(path, options={})
        super(path, "file created: #{path}", options)
      end

    end
  end
end
