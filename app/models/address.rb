# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :order, optional: true
end
