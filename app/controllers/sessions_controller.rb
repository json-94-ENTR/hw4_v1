class SessionsController < ApplicationController
  def new
  end

  def create
  @user = User.find_by({ "email" => params["email"] })
  if @user
    if BCrypt::Password.new(@user["password"]) == (params ["password"])
      flash["notice"] = "Welcome! You've logged in."
      cookies["user_id"] = @user["id"]
      redirect_to "/places"
      else 
        flash["notice"] = "Unsuccessful login."
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Unsuccessful login."
      redirect_to "/sessions/new"
    end
  end

  def destroy
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/sessions/new"
  end