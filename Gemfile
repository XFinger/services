source 'https://rubygems.org'

gem 'rake'
gem 'sinatra'
gem 'json'
#gem 'rack-ssl-enforcer'
gem 'httparty'
gem 'rack'
gem 'sinatra-jsonp'

#gem 'sinatra-json'
#gem 'sinatra-contrib'

# Prevent installation on Heroku with
# heroku config:add BUNDLE_WITHOUT="development:test"
group :development, :test do
#  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
   gem 'client', :path => 'client'
   gem 'webmock'
   gem 'rack-test'
   gem 'mocha'
end

if RbConfig::CONFIG['host_os'] =~ /darwin/
  group :development do
    gem 'thin'
    gem 'pry'
  end
end
