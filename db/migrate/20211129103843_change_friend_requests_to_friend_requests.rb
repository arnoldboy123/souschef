class ChangeFriendRequestsToFriendRequests < ActiveRecord::Migration[6.0]
  def change
    rename_table :FriendRequests, :friend_requests
  end
end
