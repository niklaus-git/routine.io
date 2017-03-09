class AddOptionsToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :options, :integer
  end
end
