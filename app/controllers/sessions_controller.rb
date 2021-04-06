class SessionsController < ApplicationController

    def new
    end
  
    def create
        
        if user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
          
          session[:user_id] = user.id
          redirect_to '/'
        else
          puts 'its here'
          redirect_to '/login'
        end
    end
  
    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end
end
