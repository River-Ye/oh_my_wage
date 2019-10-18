FactoryBot.define do

  factory :admin, class: User do
    name { Faker::Name.name }
    sequence(:number, '001') { |n| "a000#{n}" }
    password {'000000'}
    phone { ['09006', 5.times.map{rand(10)}].join }
    sequence(:email, '001') { |n| "a#{n}@oh-my-wage" }
    gender { [0, 1].sample }
    role { 0 }
  end

  factory :staff, class: User do
    name { Faker::Name.name }
    sequence(:number, '001') { |n| "t000#{n}" }
    password {'123123'}
    phone { ['09010', 5.times.map{rand(10)}].join }
    sequence(:email, '001') { |n| "t#{n}@oh-my-wage" }
    gender { [0, 1].sample }
    role { 1 }
  end
  
  factory :student, class: User do
    name { Faker::Name.name }
    sequence(:number, '001') { |n| "s000#{n}" }
    password {'123123'}
    phone { ['09005', 5.times.map{rand(10)}].join }
    sequence(:email, '001') { |n| "s#{n}@oh-my-wage" }
    gender { [0, 1].sample }
    role { 2 }
  end
end