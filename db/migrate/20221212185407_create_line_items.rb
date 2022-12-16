class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.references :book, null: false, foreign_key: true, index: false
      t.references :cart, null: false, foreign_key: true, index: false
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end

    add_index :line_items, %i[cart_id book_id], unique: true
  end
end
