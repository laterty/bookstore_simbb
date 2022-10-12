require 'factory_bot_rails'

Book.destroy_all
=begin
Book.create!([{
               title: 'Physics',
               author: 'Pete Docter',
               description: 'A.',
               price: 23.99,
               category: 'Photo'
             },
              {
                title: 'Biology',
                author: 'Pete Docter',
                description: 'B.',
                price: 26.99,
                category: 'Photo'
              },
              {
                title: 'English',
                author: 'Pete Doct',
                description: 'C.',
                price: 29.99,
                category: 'Web Design'
              },
              {
                title: 'Chemistry',
                author: 'Bereznyak',
                description: 'D.',
                price: 35.99,
                category: 'Mobile Development'
              }])
=end

FactoryBot.create_list(:book, 40)
