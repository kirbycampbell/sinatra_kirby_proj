class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :dish_name
      t.string :cook_time
      t.integer :price
      t.boolean :available?
      t.integer :table_id
    end
  end
end
