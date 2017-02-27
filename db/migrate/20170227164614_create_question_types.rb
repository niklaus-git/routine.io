class CreateQuestionTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :question_types do |t|
      t.string :name
      t.boolean :require_answer_possibilities

      t.timestamps
    end
  end
end
