# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
Book.destroy_all

Book.create!([{
               title: 'Physics',
               author: 'Pete Docter',
               description: 'A.',
               price: 23.99
             },
              {
                title: 'Biology',
                author: 'Pete Docter',
                description: 'B.',
                price: 26.99
              },
              {
                title: 'English',
                author: 'Pete Doct',
                description: 'C.',
                price: 29.99
              },
              {
                title: 'Chemistry',
                author: 'Bereznyak',
                description: 'D.',
                price: 35.99
              }])
