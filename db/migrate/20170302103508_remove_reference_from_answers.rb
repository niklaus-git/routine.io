class RemoveReferenceFromAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :answers, :question, foreign_key: true
    add_reference :answers, :routine, foreign_key: true
  end
end
