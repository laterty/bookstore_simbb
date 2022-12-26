# frozen_string_literal: true

ActiveAdmin.register Review do
  Review.statuses.each_key do |status|
    scope status
  end

  index do
    selectable_column
    id_column
    column :book
    column :rating
    column :status
    actions
  end

  action_item :approve, only: :show, if: proc { resource.unprocessed? } do
    link_to t('active_admin.reviews.buttons.approve'), approve_admin_review_path(review), method: :put
  end

  action_item :reject, only: :show, if: proc { resource.unprocessed? } do
    link_to t('active_admin.reviews.buttons.reject'), reject_admin_review_path(review), method: :put
  end

  member_action :approve, method: :put do
    resource.approved!
    redirect_to resource_path, notice: I18n.t('active_admin.reviews.notice.approved')
  end

  member_action :reject, method: :put do
    resource.rejected!
    redirect_to resource_path, notice: I18n.t('active_admin.reviews.notice.rejected')
  end

  show do
    attributes_table do
      row :title
      row :content
      row :rating
      row :status
      row :book
      row :user
      row :created_at
    end
  end
end
