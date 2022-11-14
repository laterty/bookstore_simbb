# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, null: false
      t.string :img_url
      t.string :year_of_publication, null: false
      t.string :dimensions, null: false
      t.string :materials, null: false
      t.references :category, null: false

      t.timestamps
    end
  end
end
