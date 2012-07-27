# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :timing do
    user { FactoryGirl.create(:user) }
    trail { FactoryGirl.create(:trail) }
    seconds 3600
  end
end
