class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :destroy]
	before_action :require_same_user, only: [:edit, :update, :destroy]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:succes] = "Account updated!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end

	private 

	def user_params
		params.require(:user).permit(:username, :email)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if !logged_in? || current_user != @user
			flash[:danger] = "You are allow to only edit your informations"
			redirect_to root_path
	end
	
end