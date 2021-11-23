class ChangeFriendRequestToFriendRequest < ActiveRecord::Migration[6.0]
  def change
    rename_table :friend_requests, :FriendRequests
  end
end
