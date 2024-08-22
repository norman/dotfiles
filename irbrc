require 'irb/completion'
# require 'irb/ext/save-history'

ARGV.concat %w(--readline --prompt-mode simple)
IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = "#{ENV["HOME"]}/.irb-history"
IRB.conf[:AUTO_INDENT] = true

if defined?(Rails)
  include Rails.application.routes.url_helpers
end

at_exit do
  puts
end
