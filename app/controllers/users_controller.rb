class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(@user)
      redirect_to root_url
    else
      flash[:error] = "Invalid Input"
      redirect_to new_session_url
    end
  end

end