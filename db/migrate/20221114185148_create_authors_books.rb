# frozen_string_literal: true

class CreateAuthorsBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :authors_books do |t|
      t.belongs_to :book, foreign_key: true, null: false, index: false
      t.belongs_to :author, foreign_key: true, null: false, index: false

      t.index :author_id, unique: true
      t.index :book_id, unique: true
      t.timestamps
    end
  end
end
