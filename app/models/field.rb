class Field < ApplicationRecord
  belongs_to :answer
  belongs_to :question

  def self.stored_answer(answer_id, question_id)
    field = Field.find_by_question_id_and_answer_id(question_id, answer_id)
    field.name
  end
end
