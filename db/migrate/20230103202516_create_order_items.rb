class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :book, foreign_key: true, index: false
      t.references :order, null: false, foreign_key: true, index: false
      t.integer :quantity, null: false, default: 1
      t.decimal :price, null: false
      t.text :description, null: false
      t.string :title, null: false

      t.timestamps
    end

    add_index :order_items, %i[order_id book_id], unique: true
  end
end
