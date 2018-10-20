class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :dob
      t.string :password_digest
      t.integer :table_id
    end
  end
end
