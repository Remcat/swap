class AddOwnerAndGroupToEvent < ActiveRecord::Migration
  def change
    add_column :events, :owner_id, :integer
    add_column :events, :group_id, :integer
  end
end
