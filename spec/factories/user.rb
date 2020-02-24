FactoryBot.define do

  factory :user do
    nickname              { "テスト用ユーザー" }
    email                 { "usertest@usertest.com" }
    password              { "test1234" }
    password_confirmation { "test1234" }
    icon                  { nil }
    gender                { "not_public" }
    profile               { nil }
    birthday              { Date.new(1990, 01, 01) }

  end

end