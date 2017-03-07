class Question < ApplicationRecord
  belongs_to :routine
  belongs_to :question_type

  has_many :question_choices, dependent: :destroy
  accepts_nested_attributes_for :question_choices, reject_if: :all_blank, allow_destroy: true

  validates :name, uniqueness: { case_sensitive: false, scope: :routine_id }, presence: true

  def type
    self.question_type.name
  end

end
