# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :author
      t.decimal :price
      t.string :img_url
      t.string :year_of_publication
      t.string :dimensions
      t.string :materials
      t.references :category

      t.timestamps
    end
  end
end
