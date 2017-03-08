class Question < ApplicationRecord
  belongs_to :routine
  belongs_to :question_type

  has_many :question_choices, inverse_of: :question, dependent: :destroy
  accepts_nested_attributes_for :question_choices, reject_if: :all_blank, allow_destroy: true

  validates :name, uniqueness: { case_sensitive: false, scope: :routine_id }, presence: true
  validates_presence_of :question_choices, if: :multiple_choice?

  def type
    self.question_type.name
  end

  private

  def multiple_choice?
    self.type == 'multiple choice'
  end
end
