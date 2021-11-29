class UsersController < ApplicationController

  def index
    @users = User.search_by_email(params[:query])
    @following = current_user.friend_requests
  end
end
