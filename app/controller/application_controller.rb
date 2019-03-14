class ApplicationController < Sinatra::Base
  
  configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "Qweasd34"
  end
  
  helpers do 
    def logged_in
      !!session[:email]
    end
    
end