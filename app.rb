require 'httparty'
require 'json'
require 'fileutils'
require 'sinatra'
require 'sinatra/json'
require 'rack/contrib/jsonp'
require File.expand_path(File.join(File.dirname(__FILE__), './models/version'))
#require 'rack-ssl-enforcer'

#use Rack::SslEnforcer unless ENV['RACK_ENV']=='test'
set :public_folder, File.dirname(__FILE__) + '/public'
set :root, File.dirname(__FILE__)
enable :logging

set :protection, except: [:json_csrf]

helpers do
  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Testing HTTP Auth")
      throw(:halt, [401, "Not authorized\n"])
    end
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['admin', 'responder']
  end
end

#before { protected! if request.path_info == "/" && request.request_method == "GET" && ENV['RACK_ENV']!='test' }

get '/' do
  {status: 'ok no'}.to_json
  

end

post '/create' do
  {status: 'ok', message: "created #{params['message']}"}.to_json
end

get '/version' do
  {:version => App::VERSION}.to_json
end
get '/see_click_fix' do
@date = Date.today - 60
  @closed_today= HTTParty.get("https://seeclickfix.com/api/v2/issues.json?place_url=raleigh&status=closed&after=2015-02-1T01:00:00-04:00&page=1&per_page=1000")
  @open_today = HTTParty.get("https://seeclickfix.com/api/v2/issues.json?place_url=raleigh&status=open&after=#{@date}&page=1&per_page=1000")
  
  data = {:closed =>@closed_today['issues'].size,
   :open => @open_today['issues'].size}.json
     

end


get '/see_click_fix_old' do
  #content_type "application/javascript"
  content_type "application/json"
  @date = Date.today - 60
  @closed_today= HTTParty.get("https://seeclickfix.com/api/v2/issues.json?place_url=raleigh&status=closed&after=2015-02-1T01:00:00-04:00&page=1&per_page=1000")
  @open_today = HTTParty.get("https://seeclickfix.com/api/v2/issues.json?place_url=raleigh&status=open&after=#{@date}&page=1&per_page=1000")
  
  data = {:closed =>@closed_today['issues'].size,
   :open => @open_today['issues'].size}
  jsonp data      
end


private

def debug_env
  puts `which ruby`
end
