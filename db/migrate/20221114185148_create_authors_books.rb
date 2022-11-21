# frozen_string_literal: true

class CreateAuthorsBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :authors_books do |t|
      t.belongs_to :book, foreign_key: true, null: false, index: false
      t.belongs_to :author, foreign_key: true, null: false, index: false

      t.timestamps
    end

    add_index :authors_books, %I[author_id book_id], unique: true
  end
end
