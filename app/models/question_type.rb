class QuestionType < ApplicationRecord
  has_many :questions

  validates :name, uniqueness: { case_sensitive: false }, presence: true
end
