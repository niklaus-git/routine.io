class ChangeCollumnInFields < ActiveRecord::Migration[5.0]
  def change
    rename_column :fields, :answer, :name
  end
end
