FactoryBot.define do
  factory :salary do
    user { nil }
    date { "2019-09-22 00:00:22" }
    hr { 1 }
    hourly_wage { 1 }
  end
end
