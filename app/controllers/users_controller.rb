class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params_user)
  	if @user.save
      session[:user_id] = @user.id
  		redirect_to root_path, notice: "New account created."
  	else
      redirect_to root_path, notice: "There was a problem, homie. Looks like you ain't doin' nothin' today."
  	end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Account was deleted."
  end

  private

  def params_user
  	params.require(:user).permit(:username, :email, :password, :password_confirmation, :about)
  end

end
