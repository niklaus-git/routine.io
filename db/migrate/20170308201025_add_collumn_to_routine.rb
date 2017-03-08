class AddCollumnToRoutine < ActiveRecord::Migration[5.0]
  def change
    add_column :routines, :template, :boolean
  end
end
