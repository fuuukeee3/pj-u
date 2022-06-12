class SessionsController < ApplicationController
  def new
  end

  def create
    errors = []
    errors << "ユーザーIDを入力してください" if params[:user_id].empty?
    errors << "パスワードを入力してください" if params[:password].empty?
    if errors.present?
      flash.now[:alert] = errors.join(",")
      return render :new
    end

    # ログイン処理を行う
    user = User.find_by(
      user_id: params[:user_id],
      password_hash: Digest::SHA256.hexdigest(params[:password])
    )

    if user
      session[:user_id] = user.id
      redirect_to :photos
    else
      flash.now[:alert] = "ユーザーIDかパスワードが違います"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
