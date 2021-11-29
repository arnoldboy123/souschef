class RemoveApprovedFromFriendRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :friend_requests, :approved, :boolean
  end
end
