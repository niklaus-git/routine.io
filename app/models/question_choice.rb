class QuestionChoice < ApplicationRecord
  belongs_to :question

  validates :name, uniqueness: { case_sensitive: false, scope: :question_id }, presence: true
end
