class AddReferenceToQuestionChoice < ActiveRecord::Migration[5.0]
  def change
    add_reference :question_choices, :question, foreign_key: true
  end
end
