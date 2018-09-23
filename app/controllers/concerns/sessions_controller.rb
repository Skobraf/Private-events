class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			flash[:success] = 'your logged'
			redirect_to root_path
		else
			flash.now[:danger] = " Email or password are wrong"
			render 'new'
		end
	end

	def destroy
	end
end