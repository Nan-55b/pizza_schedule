class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # 新規登録後にログイン状態にする
      redirect_to root_path, notice: '登録が完了しました。トップページに戻ります。'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,)
  end
end
