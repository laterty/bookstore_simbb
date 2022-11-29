# frozen_string_literal: true

class AddFieldsToBook < ActiveRecord::Migration[6.1]
  def change
    change_table :books do |t|
      t.text :description, null: false
      t.decimal :price, null: false
      t.string :year_of_publication, null: false
      t.string :dimensions, null: false
      t.string :materials, null: false
      t.references :category, null: false
    end
  end
end
