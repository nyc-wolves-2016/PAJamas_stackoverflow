

37.times { User.create(username: Faker::Internet.user_name,
                       email: Faker::Internet.safe_email,
                       password: 'doom')
          }


10.times { Question.create(title: Faker::Lorem.sentence,
                           body: Faker::Company.profession,
                           asker_id: (rand(9) + 1))
          }

37.times { Answer.create(body: Faker::Lorem.sentence,
                         answerer_id: (rand(9) + 1),
                         question_id: (rand(9) + 1))
          }

Question.all.each do |question|
  question.comments = Array.new(5) {
                      Comment.create(body: Faker::Hipster.sentence,
                                     commenter_id: (rand(9) + 1))
                                   }
10.times do
  id= 0
    loop do
      id = rand(9) + 1
      break if !question.vote_ids.include?(id)
    end
    question.votes << Vote.create(:voter_id => id,
                                  value: [1, -1].sample)
  end
end

Answer.all.each do |answer|
  answer.comments = Array.new(5) {
                      Comment.create(body: Faker::Hipster.sentence,
                                     commenter_id: (rand(9) + 1))
                                   }
10.times do
 id= 0
   loop do
     id = rand(9) + 1
     break if !answer.vote_ids.include?(id)
   end
   answer.votes << Vote.create(:voter_id => id,
                                 value: [1, -1].sample)
 end
end

Comment.all.each do |comment|
  10.times do
   id= 0
     loop do
       id = rand(9) + 1
       break if !comment.vote_ids.include?(id)
     end
     comment.votes << Vote.create(:voter_id => id,
                                   value: [1, -1].sample)
  end
end
