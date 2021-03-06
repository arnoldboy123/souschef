class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.text :instructions
      t.integer :cooking_time

      t.timestamps
    end
  end
end
