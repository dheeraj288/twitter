class FollowingController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  before_action :get_user

  def index
    @following = @user.following.paginate(page: params[:page], per_page: 10).order('fullname DESC')
  end

  def new
    @follow = current_user.following_relationships.new()
  end

  def create
    @follow = current_user.following_relationships.new(following_id: params[:username])
    if @follow.save
      user = User.find_by(username: params[:username])
      redirect_to user_path(user.username), notice: "You are now following @#{user.username}"
    else
      render :new
    end
  end

  def destroy
    relation = current_user.following_relationships.find_by(following_id: @user.username)
    if relation.destroy
      redirect_to user_path(@user.username), notice: "You are not following @#{@user.username} anymore"
    end
  end

  private

  def get_user
    @user = User.find_by(username: params[:username])
  end

end
