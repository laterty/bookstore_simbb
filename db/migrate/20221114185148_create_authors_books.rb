# frozen_string_literal: true

class CreateAuthorsBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :authors_books do |t|
      t.belongs_to :book, foreign_key: true, null: false
      t.belongs_to :author, foreign_key: true, null: false

      t.timestamps
    end
  end
end
