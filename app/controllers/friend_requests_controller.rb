class FriendRequestsController < ApplicationController

  def create
    req = FriendRequest.new
    req.requester = current_user
    req.recipient_id = params[:user_id]
    req.save!
    redirect_to users_path
  end
end
