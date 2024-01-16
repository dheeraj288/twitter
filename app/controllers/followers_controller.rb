class FollowersController < ApplicationController
  before_action :authenticate_user!, only: [:follow, :unfollow]
  before_action :get_user

  def index
    @followers = @user.followers.paginate(page: params[:page], per_page: 10).order('fullname DESC')
  end

  private
  def get_user
    @user = User.find_by(username: params[:username])
  end
end
