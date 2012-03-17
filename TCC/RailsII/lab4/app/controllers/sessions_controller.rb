class SessionsController < ApplicationController

  before_filter :require_user, only: [:destroy]
  
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to stores_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid e-mail address or password.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out.'
  end

end