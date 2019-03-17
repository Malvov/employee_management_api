require 'faker'

FactoryBot.define do
    factory :user do
        username { Faker::Internet.username }
        email { Faker::Internet.email }
        password { 'password' }
        employee
    end
end