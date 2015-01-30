class UsersController < ApplicationController

	def index
		@users = User.all
		@photos = Photo.all
	end

	def new 
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
		session[:user_id] = @user.id.to_s
		
		redirect_to edit_user_path(@user)
	else
		render :new, alert: "Try again, hombre!"
	end
end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		

	end

	def update 
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to users_path
		else 
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user = current_user.destroy
		session.delete(:user_id)
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:title, :username, :email, :password, :password_confirmation)

	end
end














