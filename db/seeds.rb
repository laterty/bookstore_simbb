# frozen_string_literal: true

require 'factory_bot_rails'

Book.destroy_all
Category.destroy_all
Author.destroy_all
AuthorsBook.destroy_all
AdminUser.destroy_all

Category::NAMES.each { Category.create(name: _1) }

FactoryBot.create_list(:authors_book, 40)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
