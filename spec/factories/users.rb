# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    provider { 'facebook' }
    uid { rand(10**10) }
    password { "#{FFaker::Internet.password(9, 16)}Yy*1" }
  end
end
