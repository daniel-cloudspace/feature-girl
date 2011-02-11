class AddCoordinatesToFeatures < ActiveRecord::Migration
  def self.up
    add_column :features, :left, :integer, :default => 0
    add_column :features, :top, :integer, :default => 0
  end

  def self.down
    remove_column :features, :top
    remove_column :features, :left
  end
end
