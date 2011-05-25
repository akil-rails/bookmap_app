class AddMembersCountToStores < ActiveRecord::Migration
  def self.up
    add_column :stores, :members_count, :integer, :default => 0
    
    Store.reset_column_information
    Store.find(:all).each do |s|
      Store.update_counters s.id, :members_count => s.members.length
    end
  end

  def self.down
    remove_column :stores, :members_count
  end
end
