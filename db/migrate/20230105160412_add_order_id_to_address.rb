class AddOrderIdToAddress < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :order, index: false
    add_index :addresses, %i[order_id type], unique: true
  end
end
