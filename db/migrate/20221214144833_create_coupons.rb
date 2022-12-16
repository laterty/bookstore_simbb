class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.integer :discount, null: false
      t.string :code, null: false
      t.references :cart, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
