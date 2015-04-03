require 'sinatra'
require './app'

# This breaks the new passenger setup find new logging option
#log = File.new("./log/sinatra.log", "a+")
#STDOUT.reopen(log)
#STDERR.reopen(log)
set :protection, :except => :json_csrf

run Sinatra::Application
