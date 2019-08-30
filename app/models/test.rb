class Test < ApplicationRecord
	# has_many :choices, :dependent => :destroy
	# accepts_nested_attributes_for :choices, :reject_if => lambda { |a| a[:question].blank? }, :allow_destroy => true
	has_many :test_questions, dependent: :destroy
	has_many :questions, through: :test_questions
   has_many :answers, dependent: :destroy

end
