begin
  require "rubygems"
  require "pry"
  Pry.start
  exit
rescue LoadError => e
  warn "=> Unable to load Pry"
end

# Uncomment this if you want the executed SQL queries to be shown on Rails console.
# IRB.conf[:IRB_RC] = Proc.new do
#   logger = Logger.new(STDOUT)
#   ActiveRecord::Base.logger = logger
#   ActiveResource::Base.logger = logger
# end

IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_I => ">> ",
  :PROMPT_S => "%l>> ",
  :PROMPT_C => "  ",
  :PROMPT_N => "  ",
  :RETURN => "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM
IRB.conf[:AUTO_INDENT] = true
