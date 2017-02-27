class RenameRequireAnswerPossibilitiesToRequireQuestionChoices < ActiveRecord::Migration[5.0]
  def change
    rename_column :question_types, :require_answer_possibilities, :require_question_choices
  end
end
