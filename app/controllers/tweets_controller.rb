class TweetsController < ApplicationController
  def create
    photo = Photo.find(params[:photo_id])
    res = photo.tweet(session[:access_token])

    if res.is_a?(Net::HTTPCreated)
      flash[:notice] = "#{photo.title}をMyTweet Appにツイートしました。"
    else
      flash[:alert] = "MyTweet Appへのツイートに失敗しました。"
    end

    redirect_to photos_path
  end

  private
end
