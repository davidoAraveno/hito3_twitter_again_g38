class TweetsController < ApplicationController
  def index
      @tweet = Tweet.new
      if params[:retweet].present?
        @tweet.tweet_id = params[:retweet]
      end

      if params[:busqueda]
        @tweets = Tweet.where('content LIKE ?', "%#{params[:busqueda]}%")
      else
        @tweets = Tweet.all.reverse
      end

      @friend = Friend.new
      if session[:user_id]
        @yo = User.find(session[:user_id])
      end


  end

  def show
    @tweet = Tweet.find(params[:id])
  end


  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = session[:user_id]
    if @tweet.save
      redirect_to i_tweets_path
    else
      redirect_to i_tweets_path
    end
  end

  def news
    @tweets = Tweet.all.order(created_at: :desc)
    @tweet = @tweets[0].likes.size

    render json: @tweets.to_json
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id, :retweets, :tweet_id)
  end
end