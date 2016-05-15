class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_initialize_by(email: params[:email])

    if @user.authenticate?(params[:password]) && @user.save
      session[:user_id] = @user.id
      session[:user_email] = @user.email

      redirect_to users_path, notice: 'Logged in!'
    else
      flash.now.alert = "It was not possible to log in. Solve errors and try again."
      render :new, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_email] = nil

    redirect_to new_session_path , notice: 'Logged out'
  end
end
