module UserHelper
   def user_result(test,user)
      # fail
      @answers = test.answers
      score = 0
      @answers.each do |a|
        if user.id == a.user_id 
         score = score + a.score
        end
      end
      "<strong>#{score}</strong>".html_safe
   end

   def date_of_examination(test)
      @answers = test.answers.last
      date = @answers.updated_at.to_date
   end
end
