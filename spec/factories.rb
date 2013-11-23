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
    question_id 1
    responder_id 1
  end

  factory :vote do
    answer_id 1
    voter_id 1
    state 1
  end

  factory :question_with_answer do
      after_create do |question|
        create(:answer, question: question)
      end
  end
end

