# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trail do
    name "TestTrail"
    length "5.0 miles"
    difficulty "Legendary"
  end
end
