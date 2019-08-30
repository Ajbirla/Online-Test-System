class AnswerOption < ApplicationRecord
  belongs_to :choice
  belongs_to :answer
end
