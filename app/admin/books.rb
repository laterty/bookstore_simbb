# frozen_string_literal: true

ActiveAdmin.register Book do
  includes :category
  decorate_with BookDecorator

  permit_params :title, :description, :year_of_publication, :price,
                :dimensions, :materials, :category_id, :cover_image, :quantity,
                author_ids: [], images: []

  index do
    selectable_column
    id_column
    column :title
    column :description, :short_description
    column :price
    column :category
    column :authors, :authors_names
    column :cover_image do |book|
      image_tag(book.cover_image.url, class: 'admin_image')
    end
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
      row :quantity
      row :created_at
      row :updated_at
      book.images.each do |image|
        row image do
          image_tag(image.url, class: 'admin_image')
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :title
      f.input :authors, collection: Author.all
      f.input :description
      f.input :year_of_publication
      f.input :dimensions
      f.input :materials
      f.input :price, min: Book::MIN_PRICE_VALUE
      f.input :cover_image, as: :file
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :quantity, min: Book::MIN_QUANTITY
    end
    actions
  end
end
