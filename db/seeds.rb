require 'factory_bot_rails'

Book.destroy_all

FactoryBot.create_list(:book, 40)
