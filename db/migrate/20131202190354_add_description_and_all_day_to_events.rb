class AddDescriptionAndAllDayToEvents < ActiveRecord::Migration
  def change
    add_column :events, :description, :string
    add_column :events, :all_day, :boolean
  end
end
