class AddImagesToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :images, :json
    add_column :books, :cover_image, :json
  end
end
