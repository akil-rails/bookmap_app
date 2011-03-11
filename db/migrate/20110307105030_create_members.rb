class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :card_id
      t.string :address
      t.float :lat
      t.float :lng
      
      t.references :store

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
