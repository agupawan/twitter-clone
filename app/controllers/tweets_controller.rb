class TweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = Tweet.new(tweet_params.merge(user: current_user))
    if tweet.save
      redirect_to dashboard_path
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to dashboard_path
  end

def show
end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
