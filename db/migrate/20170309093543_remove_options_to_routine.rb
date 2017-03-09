class RemoveOptionsToRoutine < ActiveRecord::Migration[5.0]
  def change
    remove_column :routines, :options, :integer
  end
end
