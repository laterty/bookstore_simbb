# frozen_string_literal: true

ActiveAdmin.register Book do
  includes :category
  decorate_with BookDecorator

  permit_params :title, :description, :year_of_publication, :price,
                :dimensions, :materials, :category_id,
                author_ids: []

  index do
    selectable_column
    id_column

    column :title
    column :description, :short_description
    column :price
    column :category
    column :authors, :authors_names
    actions
  end

  show do
    attributes_table do
      row :category
      row :title
      row :authors, :authors_names
      row :description
      row :year_of_publication
      row :materials
      row :price
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :title
      f.input :authors, collection: Author.all, as: :check_boxes
      f.input :description
      f.input :year_of_publication
      f.input :dimensions
      f.input :materials
      f.input :price, :min => Book::MIN_PRICE_VALUE
    end
    actions
  end
end
