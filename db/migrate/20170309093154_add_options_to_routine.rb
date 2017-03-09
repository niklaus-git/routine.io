class AddOptionsToRoutine < ActiveRecord::Migration[5.0]
  def change
    add_column :routines, :options, :integer
  end
end
