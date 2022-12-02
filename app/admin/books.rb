# frozen_string_literal: true

ActiveAdmin.register Book do
  includes :category
  decorate_with BookDecorator

  permit_params :name, :description, :quantity, :year_of_publication, :price,
                :height, :width, :length, :materials, :category_id,
                author_ids: []

  index do
    selectable_column
    id_column

    column :title
    column :description
    column :price
    column :category
    column :authors, :authors_names
    actions
  end
end
