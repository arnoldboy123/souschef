class CreatePlannedRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :planned_recipes do |t|
      t.date :date
      t.references :recipe, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
