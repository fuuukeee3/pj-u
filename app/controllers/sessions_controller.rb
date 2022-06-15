class SessionsController < ApplicationController
  def new
    @login = Login.new
  end

  def create
    @login = Login.new(user_id: params[:login][:user_id], password: params[:login][:password])
    unless @login.valid?
      return render :new
    end

    # ログイン処理を行う
    user = User.find_by(
      user_id: @login.user_id,
      password_digest: Digest::SHA256.hexdigest(@login.password)
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
    reset_session
    redirect_to login_path
  end
end
