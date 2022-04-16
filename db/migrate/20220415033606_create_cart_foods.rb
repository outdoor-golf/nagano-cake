class CreateCartFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_foods do |t|
      t.integer :food_id,null: false
      t.integer :user_id,null: false
      t.integer :quantity,null: false

      t.timestamps
    end
  end
end
