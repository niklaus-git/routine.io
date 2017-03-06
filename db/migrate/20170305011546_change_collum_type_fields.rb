class ChangeCollumTypeFields < ActiveRecord::Migration[5.0]
  def change
  end

  def self.up
    change_table :fields do |t|
      t.change :name, :text
    end
  end
  def self.down
    change_table :fields do |t|
      t.change :name, :string
    end
  end
end
