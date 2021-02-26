class LikesController < ApplicationController
  def create
    @verificacion = Like.find_by(
      tweet_id: params[:id_tweet],
      user_id: params[:id_user])

    if @verificacion.present?
      @verificacion.destroy
      redirect_to i_tweets_path
    else
      @like = Like.new()
      @like.tweet_id = params[:id_tweet]
      @like.user_id = params[:id_user]
      @like.save
      redirect_to i_tweets_path
    end
  end
end