class SessionsController < ApplicationController
  def new
    redirect_to root_url if current_user
  end

  def create
    user = User.find_by_email params[ :email ]

    if user && user.authenticate( params[ :password ] )
      login user
      redirect_to root_url, notice: "Logged in"
    else
      flash.now.alert = "Invalid email or password"
      logout
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: "Logged out"
  end
end
