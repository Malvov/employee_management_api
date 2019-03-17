require 'faker'

FactoryBot.define do
    factory :employee do
        first_name { Faker::Name.first_name }
        last_name { Faker::Name.last_name }
        entry_date { 20.years.ago }
        user
    end
end