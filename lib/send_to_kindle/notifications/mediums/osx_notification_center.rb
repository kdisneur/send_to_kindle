module SendToKindle
  module Notifications
    module Mediums
      module OsxNotificationCenter

        def send
          super
          TerminalNotifier.notify(message, open: "file://#{file_path}", title: 'Send to Kindle')
        end

      end
    end
  end
end
