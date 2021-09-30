class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_email(params[:email])
    # Password.create(params[:password])
    # if user &&  
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Bienvenido'
    else
      session[:id] = nil
      redirect_to root_path, notice: 'Acceso no Autorizado'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Session Close'
  end
end
