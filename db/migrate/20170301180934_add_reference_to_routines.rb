class AddReferenceToRoutines < ActiveRecord::Migration[5.0]
  def change
    add_reference :routines, :user, foreign_key: true
  end
end
