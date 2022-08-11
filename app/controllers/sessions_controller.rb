class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if !User.find_by(id: session[:user_id]).nil?
      flash[:alert] = "先にログアウトしてください"
      redirect_to login_url
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "ログインしました"
      redirect_to todos_url
    else
      flash[:alert] ="ログイン名もしくはパスワードが間違っています"
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to login_url
  end
end
