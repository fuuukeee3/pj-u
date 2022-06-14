require "net/http"

class Photo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :image_file, presence: true

  # MyTweet Appにツイートする
  # @param access_token アクセストークン
  # @return [Net::HTTPResponse]
  def tweet(access_token)
    Net::HTTP.post(
      URI.parse("https://arcane-ravine-29792.herokuapp.com/api/tweets"),
      {
        "text" => "タイトル: #{title}",
        "url" => "#{Constants::BASE_URL}/assets/#{image_file}"
      }.to_json,
      {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{access_token}"
      }
    )
  end
end
