class Answer < ApplicationRecord
  belongs_to :routine
  has_many :fields, dependent: :destroy

  def exists?(question)
    results = self.fields.where(question_id: question.id)
    results.empty? ? false : true
  end

  def new_question(question)
    self.fields.create(question_id: question.id, answer_id: self.id)
  end

  def date
    self.created_at.strftime("%-d %B %Y")
  end

  def today?
    self.created_at.to_date == Time.now.utc.to_date
  end
end
