class SessionsController < ApplicationController
  def create
  	@user = User.find_by(email: params[:email])
  	if @user and @user.password == params[:password]
  		session[:user_id] = @user.id
  		redirect_to root_path, notice: "Signed in."
  	else
  		redirect_to signin_path, notice: "There was a problem sigining in."
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: "Logged out."
  end
end
