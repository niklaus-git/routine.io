class CreateAnswerPossibilities < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_possibilities do |t|
      t.string :name

      t.timestamps
    end
  end
end
