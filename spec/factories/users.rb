FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {'たた'}
    last_name {'たた'}
    kana_firstname {'タタ'}
    kana_lastname {'タタ'}
    birthday {'2015-05-05'}
  end
end