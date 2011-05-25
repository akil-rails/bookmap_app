class AddDistanceFromStoreToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :distance_from_store, :float, :default => 0
  end

  def self.down
    remove_column :members, :distance_from_store
  end
end
