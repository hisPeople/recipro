class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :title
      t.integer :preptime
      t.integer :cooktime
      t.text :ingredients
      t.text :directions
      t.integer :servings
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
