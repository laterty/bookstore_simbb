class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.string :number, null: false
      t.string :name, null: false
      t.string :cvv, null: false
      t.string :expire_date, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
