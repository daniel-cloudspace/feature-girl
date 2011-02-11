class AddCoordinatesToScenarios < ActiveRecord::Migration
  def self.up
    add_column :scenarios, :x, :integer
    add_column :scenarios, :y, :integer
  end

  def self.down
    remove_column :scenarios, :y
    remove_column :scenarios, :x
  end
end
