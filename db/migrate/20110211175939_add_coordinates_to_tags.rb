class AddCoordinatesToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :left, :integer, :default => 0
    add_column :tags, :top, :integer, :default => 0
  end

  def self.down
    remove_column :tags, :top
    remove_column :tags, :left
  end
end
