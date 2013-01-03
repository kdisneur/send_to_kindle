module SendToKindle
  module Notifications
    module Mediums
      module Kindle

        def send
          super

          mail_configuration
          send_mail
        end

      private

        def send_mail
          email_from           = self.options[:from]
          email_kindle         = self.options[:kindle]
          subject              = message
          file_attachment_path = file_path

          Mail.deliver do
            from     email_from
            to       email_kindle
            subject  subject
            add_file file_attachment_path
          end
        end

        def mail_configuration
          sender_options = self.options[:sender]
          Mail.defaults { delivery_method :smtp, sender_options }
        end

      end
    end
  end
end
