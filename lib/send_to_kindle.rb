require 'listen'
require 'net/smtp'
require 'send_to_kindle/notifications'

module SendTokindle

  def self.default_options
    {
      paths:         nil,
      file_types:    '\.pdf$',
      notifications: {
        mediums: {
          kindle:                  true,
          osx_notification_center: true,
          terminal:                false
        },
        sender: {
          address:              nil,
          port:                 nil,
          domain:               nil,
          user_name:            nil,
          password:             nil,
          authentication:       nil,
          enable_starttls_auto: false
        },
        from:   nil,
        kindle: nil
      }
    }
  end

  def self.listen(options={})
    options = default_options.merge(options)

    callback = Proc.new do |modified_paths, added_paths, removed_paths|
      modified_paths.each { |path| SendToKindle::Notifications::Modification.new(path, options[:notifications]).send }
      added_paths.each    { |path| SendToKindle::Notifications::Creation.new(path,     options[:notifications]).send }
    end

    Listen.to(options[:paths])
          .filter(Regexp.new(options[:file_types]))
          .latency(0.5)
          .force_polling(true)
          .change(&callback)
          .start
  end
end
