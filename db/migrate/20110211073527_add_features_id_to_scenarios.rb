class AddFeaturesIdToScenarios < ActiveRecord::Migration
  def self.up
    add_column :scenarios, :feature_id, :integer
  end

  def self.down
    remove_column :scenarios, :feature_id
  end
end
