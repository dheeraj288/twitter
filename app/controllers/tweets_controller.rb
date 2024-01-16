class TweetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @tweet = current_user.tweets.new()
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to user_path(current_user.username), notice: "Tweet created & published!"
    else
      render :new
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:message, :image)
  end
end
