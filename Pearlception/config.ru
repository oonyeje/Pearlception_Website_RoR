# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

# require 'rack-proxy'

# class AppProxy < Rack::Proxy
#   def rewrite_env(env)
#     request = Rack::Request.new(env)
#     if request.subdomain == "pearlception"
#       env["HTTP_HOST"] = "localhost:3001"
#     else
#       env["HTTP_HOST"] = "localhost:3000"
#     end
#     env
#   end
# end

# run AppProxy.new

# use Rack::Subdomain, "lvh.me:3000" do
#   map 'pearlception', to: "/dashboard/:subdomain"
#   #map '', to: "/"
# end


run Rails.application
