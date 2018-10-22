class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :table_number
      t.integer :head_count
      t.string :waiter_name

    end
  end
end
