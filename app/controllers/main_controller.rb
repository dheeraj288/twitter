class MainController < ApplicationController
  def index
    if user_signed_in?
      @tweets = Tweet.where(user_id: current_user.following).or(Tweet.where(user_id: current_user)).paginate(page: params[:page], per_page: 10).order('created_at DESC')
    else
      @tweets = Tweet.all.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    end
  end
end
