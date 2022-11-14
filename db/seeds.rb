# frozen_string_literal: true

require 'factory_bot_rails'

Book.destroy_all
Category.destroy_all
Author.destroy_all
AuthorsBook.destroy_all

['Photo', 'Web-development', 'Mobile-design'].each { Category.create(name: _1) }

FactoryBot.create_list(:author, 30)

FactoryBot.create_list(:book, 40)

FactoryBot.create_list(:authors_book, 40)
