# frozen_string_literal: true

categories = FactoryBot.create_list(:category, 3) unless Category.exists?
authors = FactoryBot.create_list(:author, 20) unless Author.exists?
categories.each { |category| rand(10..20).times { FactoryBot.create(:book, category:) } } unless Book.exists?
Book.all.each { FactoryBot.create(:author_book, author: authors.sample, book: _1) } unless AuthorBook.exists?
Book.all.each { FactoryBot.create(:review, book: _1) } unless Review.exists?
FactoryBot.create_list(:delivery, 3) unless Delivery.exists?

if Rails.env.development?
  AdminUser.create!(email: 'admin1@example.com',
                    password: 'password',
                    password_confirmation: 'password')
end
