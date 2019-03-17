FactoryBot.define do
    factory :shift do
        check_in { 8.hours.ago }
        check_out { Time.new }
        date { Date.new }
    end
end