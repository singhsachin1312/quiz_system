class Question < ApplicationRecord
  belongs_to :quiz
  has_many  :options, dependent: :destroy

  enum :question_type, { mcq: 0, boolean: 1, text: 2 }
end
