module SendToKindle
  module Notifications
    module Mediums
      module Terminal

        def send
          super
          puts "Send to Kindle: #{message}"
        end

      end
    end
  end
end
