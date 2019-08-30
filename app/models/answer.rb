class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :test
  has_many :answer_options, dependent: :destroy
  has_many :choices, through: :answer_options
   
  def self.destroy_previous_answer(user_id,question_id,test_id)
    where(user_id:user_id,question_id:question_id,test_id:test_id).destroy_all
  end
  def is_correct?
    correct_options=question.correct.map(&:id)
    user_options=choices.map(&:id)
    correct_options.size==user_options.size and (user_options-correct_options).empty?
 end
end
