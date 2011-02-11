class AddCoordinatesToScenarios < ActiveRecord::Migration
  def self.up
    add_column :scenarios, :left, :integer, :default => 0
    add_column :scenarios, :top, :integer, :default => 0
  end

  def self.down
    remove_column :scenarios, :top
    remove_column :scenarios, :left
  end
end
