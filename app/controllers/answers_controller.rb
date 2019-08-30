class AnswersController < ApplicationController
	
	def create
   	test_id = params[:test_id]
		@test = Test.find(test_id)
		@question_count=@test.questions.count
		page = params[:answer][:page].to_i
		question = Question.find(answer_params[:question_id])
      taken_time = (@test.duration.strftime("%M").to_i*60)-answer_params[:spend_time].to_i
		@answer = @test.answers.new(answer_params)
      # Answer.destroy_previous_answer(current_user.id,question.id,@test.id)
		@answer.spend_time = taken_time
		@answer.user_id = current_user.id
		if calculate_score(@answer,question)
   		if  page == 0
				page = page + 2  
			else
				page = page + 1
			end
			if page<=@question_count
            session[:test_url] = "#{request.base_url}/test/#{params[:test_id]}?page=#{page}"
			   redirect_to session[:test_url]
			else
            session[:test_url] = nil
				@result=Answer.where(user_id:current_user.id,test_id:@test)
            render 'answers/result'
			end
		end
	end
	def result
      session[:test_url] = nil
		@test=Test.find(params[:id])
		@question_count=@test.questions.count
      @result=Answer.where(user_id:current_user.id,test_id:@test)
      render 'answers/result'
	end
	
	def submit_test
		result
	end

   private
	def calculate_score(answer,question)
      q_choices = question.choices.where(is_correct: true)
      ans_maq = answer.choices.select{|c| c.is_correct}
      if q_choices.size == ans_maq.size
         answer.score = 1
      else
        answer.score = 0
      end
      answer.save
	end

	
	def answer_params
       params.require(:answer).permit(:question_id, :spend_time, :test_id, :choice_ids=>[])
   end
end
