class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
  set :session_secret, "my_application_secret"
  set :show_exceptions => false
end
