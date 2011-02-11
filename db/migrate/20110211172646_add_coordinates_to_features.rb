class AddCoordinatesToFeatures < ActiveRecord::Migration
  def self.up
    add_column :features, :x, :integer
    add_column :features, :y, :integer
  end

  def self.down
    remove_column :features, :y
    remove_column :features, :x
  end
end
