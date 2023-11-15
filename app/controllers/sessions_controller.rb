class SessionsController < ApplicationController
  def new
  end

  def create
      @user = User.find_by(email: params[:email])
      if @user&.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to (session[:intended_url] || @user), notice: "Welcome back, #{@user.name}"
          session[:intended_url] = nil
      else
          flash.now[:alert] = "Invalid email/password"
          render :new, status: :unprocessable_entity
      end
  end 

  def destroy
      session[:user_id] = nil
      redirect_to root_path, status: :see_other, notice: "You're signed out"
  end
end
