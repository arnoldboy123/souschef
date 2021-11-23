class AddColumnsToFriendRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :friend_requests, :requester, null: false, foreign_key: { to_table: :users }
    add_reference :friend_requests, :recipient, null: false, foreign_key: { to_table: :users }
  end
end
