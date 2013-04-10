class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_name(params[:user][:name])
    if @user && @user.password == params[:user][:password]
      flash[:success] = "Logged In!"
      login @user
      redirect_to root_url
    else
      flash[:error] = "Incorrect Password"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

end