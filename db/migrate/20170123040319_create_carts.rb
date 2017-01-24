class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, index: true
    end
    add_foreign_key :carts, :users
  end
end
