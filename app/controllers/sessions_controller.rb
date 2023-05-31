class SessionsController < ApplicationController
  def new
  end

  def create
    flash["notice"] = "Incorrect username or password"
    redirect_to "/sessions/new"
  end

  def destroy
  end
end
  