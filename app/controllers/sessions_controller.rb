class SessionsController < ApplicationController

	def new
	end

	def create
	   @user = User.where(username: params[:login][:username]).first
                if @user && @user.authenticate(params[:login][:password])
    	       session[:user_id] = @user.id.to_s
                    redirect_to users_path
                else
     	      redirect_to login_path
         end
      end

	def destroy
	   session.delete(:user_id)
         redirect_to login_path
	end
end
