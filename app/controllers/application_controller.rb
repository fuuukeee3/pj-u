class ApplicationController < ActionController::Base
  private

  # ログインしているかどうか判定する
  # @return [Boolean]
  def logged_in?
    session[:user_id].present?
  end

  # ログインしていない場合はログインページへ遷移させる
  # @return [void]
  def login_check
    unless logged_in?
      flash[:alert] = "ログインしてください"
      redirect_to login_path
    end
  end

  # ログインしているユーザを返す
  # @return [User]
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
