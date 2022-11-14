# frozen_string_literal: true

class AddDimensionsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :dimensions, :string
  end
end
