FactoryBot.define do
  factory :user do
    username Faker::Name.name
    password "password"
    factory :jeff do
      username "Jeff"
      password "password"
    end

    factory :jay do
      username "Jay"
      password "password"
    end
  end
end
