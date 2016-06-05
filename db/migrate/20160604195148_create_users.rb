class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "first", null: false
      t.string "last", null: false
      t.string "email", null: false
      t.integer "user_type"
      t.timestamps null: false
    end
  end
end
