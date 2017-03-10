class Add < ActiveRecord::Migration[5.0]
  def change
    add_column :routines, :has_answer, :boolean
  end
end
