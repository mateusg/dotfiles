Pry.config.editor = "subl -n -w"

Pry.config.prompt = proc do |object, level, pry|
  prompt = "#{RUBY_VERSION}"
  prompt << "::#{Rails.version}" if defined?(Rails)
  "#{prompt} (#{object})> "
end

Pry.config.exception_handler = proc do |output, exception, pry|
  Pry::Helpers::Text.red "#{exception.class}: #{exception.message}\n from #{exception.backtrace.first}"
end

begin
  require "awesome_print"
  Pry.config.print = proc do |output, value|
    Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)
  end
rescue LoadError => err
  warn "=> Unable to load awesome_print"
end

# if defined?(Rails)
#   begin
#     require "rails/console/app"
#     require "rails/console/helpers"
#   rescue LoadError => e
#     require "console_app"
#     require "console_with_helpers"
#   end
# end

# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false
# Pry.plugins["doc"].activate!

# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
rails = File.join Dir.getwd, 'config', 'environment.rb' 
if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  
  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end
