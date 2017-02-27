class DropAnswerPossibilities < ActiveRecord::Migration[5.0]
  def change
    drop_table :answer_possibilities
  end
end
