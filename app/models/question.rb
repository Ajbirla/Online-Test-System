class Question < ApplicationRecord
	# belongs_to :test
	has_many :choices, dependent: :destroy
	accepts_nested_attributes_for :choices, :allow_destroy => true, reject_if: :all_blank
	has_many :answers
	has_many :test_questions
	has_many :tests, through: :test_questions
	validates :question, presence: true, 
						uniqueness: {
                            case_sensitive: false
                            }
   enum q_types: ['MCQ','MAQ','FILL_In_The_Blank','True_False']
   def user_answer(user_id)
      answers.find_by(user_id:user_id)
   end

   def correct
      choices.where(is_correct: true)
   end
end
