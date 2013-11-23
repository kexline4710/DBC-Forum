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
    # asker_id 1
  end

  factory :answer do
    body 'Go left'
  end

  factory :question_with_answer do
      after_create do |question|
        create(:answer, question: question)
      end
  end
end

