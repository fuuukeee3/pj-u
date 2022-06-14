module ApplicationHelper
  # my_tweet_appの認可ページURL
  # @return [String]
  def my_tweet_app_authorization_link
    query = {
      response_type: "code",
      client_id: ENV["UNIFA_CLIENT_ID"],
      redirect_uri: oauth_callback_url,
    }.to_query

    "#{my_tweet_app_base_url}/oauth/authorize?#{query}"
  end

  private

  # my_tweet_appのBaseURL
  # @return [String]
  def my_tweet_app_base_url
    "https://arcane-ravine-29792.herokuapp.com"
  end
end
