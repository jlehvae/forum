class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :positive
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
