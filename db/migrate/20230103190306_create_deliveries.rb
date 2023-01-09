class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :delivery_method, null: false
      t.decimal :price, null: false
      t.string :time, null: false

      t.timestamps
    end
  end
end
