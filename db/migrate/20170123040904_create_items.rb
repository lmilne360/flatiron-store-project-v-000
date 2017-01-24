class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :category, index: true
    end
    add_foreign_key :items, :categories
  end
end
