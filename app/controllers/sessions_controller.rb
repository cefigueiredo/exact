class SessionsController < ApplicationController
  def new
  end

  def create
    session[:email] = params[:email] if params[:email] && params[:password]
  end

  def destroy
  end
end
