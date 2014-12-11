class AddHasConfirmedToPeople < ActiveRecord::Migration
  def change
    add_column :people, :has_confirmed, :boolean
  end
end
