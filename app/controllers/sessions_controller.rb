class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})
    if @user
    
  
    else 
    flash["notice"] = "Incorrect username or password"
    redirect_to "/sessions/new"
  end

  def destroy
  end
end
  