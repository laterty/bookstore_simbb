# frozen_string_literal: true

require 'factory_bot_rails'

FactoryBot.create_list(:category, 3) unless Category.exists?
FactoryBot.create_list(:authors_book, 40) unless AuthorsBook.exists?
