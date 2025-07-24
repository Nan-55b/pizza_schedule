class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to root_path, success: 'ログインしました'
    else
      flash.now[:danger] = t('sessions.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def guest_login
    guest_user = User.find_by(email: 'guest@example.com')
    @user = login(guest_user.email, 'password')  # ←通常ログインと同じ処理
  
    if @user
      redirect_to root_path, success: 'ゲストユーザーとしてログインしました'
    else
      redirect_to login_path, danger: 'ゲストログインに失敗しました'
    end
  end
  

  def destroy
    logout
    redirect_to root_path, success: 'ログアウトしました', status: :see_other
  end
end
