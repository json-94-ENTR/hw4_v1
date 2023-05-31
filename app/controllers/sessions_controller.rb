class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})
  if @user
    password_the_user_typed = params["password"]
    password_in_the_database = @user["password"]
    If BCrypt::Password.new(password_in_the_database) == password_the_user_typed
  
  else 
    flash["notice"] = "Incorrect username or password"
    redirect_to "/sessions/new"
  end

  def destroy
  end
end
  