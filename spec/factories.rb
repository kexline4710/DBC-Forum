FactoryGirl.define do
  
  factory :user do
    name 'Tanner'
    email 'tan@tan.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :question do
    title 'Title'
    body 'Body of wordssss'
    asker_id 1
  end

end
