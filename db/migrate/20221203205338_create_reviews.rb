class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :rating, null: false
      t.integer :status, default: 0, null: false
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
