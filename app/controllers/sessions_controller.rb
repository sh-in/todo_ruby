class SessionsController < ApplicationController
  def new
  end

  def create
    user_name = params[:name]
    user = User.find_by(name: user_name)

    if user && user.authenticate(params[:sessions][:password])
      User.log_in(user)
      redirect_to root_url, notice: "ログインしました"
    else
      redirect_to "login_url", alert: "ログイン名もしくはパスワードが間違っています"
    end
  end

  def destroy
  end
end
