class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_initialize_by(email: params[:email])

    if @user.authenticate?(params[:password])
      redirect_to users_path, notice: 'Logged in!'
    else
      flash.now.alert = "It was not possible to log in. Solve errors and try again."
      render :new
    end
  end

  def destroy
  end
end
