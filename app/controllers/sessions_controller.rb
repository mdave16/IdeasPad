# require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])

    if user.valid?
      session[:user_id] = user.id
      redirect_to request.env['omniauth.origin'] || root_url, notice: "You just signed in!"
    end
  end

  def destroy
    reset_session
    redirect_to request.referer || root_url, notice: "You just signed out!"
  end
end
