class AddRecipeToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :recipe, null: false, foreign_key: true
  end
end
