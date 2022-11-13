require 'factory_bot_rails'

Book.destroy_all

FactoryBot.create_list(:book, 40)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?