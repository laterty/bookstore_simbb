# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true
end
