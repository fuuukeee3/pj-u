require "net/http"

class OauthController < ApplicationController
  def callback
    if session[:access_token]
      flash[:notice] = "MyTweet Appのアクセストークンは取得済みです。"
    else
      session[:access_token] = get_access_token
      flash[:notice] = "MyTweet Appのアクセストークンを取得しました。"
    end
    redirect_to photos_path
  end

  private

  # MyTweet Appのアクセストークンを取得する
  # @return [String]
  def get_access_token
    # 認可コードの取得
    auth_code = params[:code]

    # アクセストークンの取得
    res = Net::HTTP.post_form(
      URI.parse("https://arcane-ravine-29792.herokuapp.com/oauth/token"),
      {
        "code" => auth_code,
        "client_id" => ENV["UNIFA_CLIENT_ID"],
        "client_secret" => ENV["UNIFA_CLIENT_SECRET"],
        "redirect_uri" => oauth_callback_url,
        "grant_type" => "authorization_code",
      }
    )

    # アクセストークンの保存
    session[:access_token] = JSON.parse(res.body)["access_token"]
  end
end
