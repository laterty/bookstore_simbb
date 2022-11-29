# frozen_string_literal: true

categories = FactoryBot.create_list(:category, 3) unless Category.exists?
authors = FactoryBot.create_list(:author, 20) unless Author.exists?
categories.each { |category| rand(10..20).times { FactoryBot.create(:book, category:) } } unless Book.exists?
Book.all.each { FactoryBot.create(:author_book, author: authors.sample, book: _1) }

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
