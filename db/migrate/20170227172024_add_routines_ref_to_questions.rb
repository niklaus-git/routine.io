class AddRoutinesRefToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :routine, foreign_key: true
  end
end
