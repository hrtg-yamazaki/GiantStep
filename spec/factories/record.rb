FactoryBot.define do

  factory :record do

    sleep    { 1 }
    study    { 1 }
    exercise { 1 }
    diet     { 1 }
    habit    { 1 }
    aim      { 1 }
    login    { 1 }
    
    association :user, factory: :user

  end

end