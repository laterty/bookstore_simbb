# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    provider { 'facebook' }
    uid { rand(10**10) }
    password { 'Yo123L**o321' }
  end
end
