class AddSitterIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :sitter_id, :integer
  end
end
