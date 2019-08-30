module AnswersHelper
	def getResult(result)
		score = 0
		result.each do |r|
		   score = score + r.score
		end
		"<strong>#{score}</strong>".html_safe
	end

	def is_check(answers, option_id)
		return false if answers.blank?
		answers.each do |answer|
			answer.choices.each do |selected|
				return selected.id == option_id
			end
		end
	end
end
