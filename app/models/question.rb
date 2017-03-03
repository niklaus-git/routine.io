class Question < ApplicationRecord
  belongs_to :routine
  belongs_to :question_type

  has_many :answers
  has_many :question_choices, dependent: :destroy

  # validates :name, uniqueness: { case_sensitive: false, scope: :routine_id }, presence: true

  def type
    self.question_type.name
  end

end
