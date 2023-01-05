class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false
      t.references :delivery, foreign_key: true
      t.integer :status, null: false, default: 0
      t.integer :stage, null: false, default: 0
      t.integer :discount

      t.timestamps
    end
  end
end

