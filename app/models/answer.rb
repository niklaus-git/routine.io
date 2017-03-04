class Answer < ApplicationRecord
  belongs_to :routine
  has_many :fields

  def exists?(question)
    results = self.fields.where(question_id: question.id)
    results.empty? ? false : true
  end

  def new_question(question)
    self.fields.create(question_id: question.id, answer_id: self.id)
  end
end
