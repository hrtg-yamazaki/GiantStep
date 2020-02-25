FactoryBot.define do

  factory :user do
    nickname              { "テスト用ユーザー" }
    email                 { "usertest@usertest.com" }
    password              { "test1234" }
    password_confirmation { "test1234" }
    privacy               { "on_public" }
    icon                  { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/gs_dashboard.png')) }
    gender                { "not_public" }
    profile               { "こんにちは" }
    birthday              { Date.new(1990, 01, 01) }

  end

end