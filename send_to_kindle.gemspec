$:.push File.expand_path('../lib', __FILE__)

require 'send_to_kindle/version'

Gem::Specification.new do |s|
  s.name        = 'send_to_kindle'
  s.version     = SendToKindle::VERSION
  s.authors     = ['Kevin Disneur']
  s.email       = ['kevin.disneur@gmail.com']
  s.homepage    = 'https://github.com/kdisneur/send_to_kindle'
  s.summary     = 'Listen to OS modification then send an email to your kindle account to add documents'

  s.add_dependency 'activesupport'
  s.add_dependency 'listen'
  s.add_dependency 'mail'
  s.add_dependency 'terminal-notifier'

  s.add_development_dependency 'bundler'

  s.files        = Dir.glob('{lib}/**/*') + %w[CHANGELOG.md README.md]

  s.require_path = 'lib'
end
