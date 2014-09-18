class AddColsToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :party, index: true
    add_column :people, :preferences, :text
    add_column :people, :status, :string
    add_column :people, :name, :string
    add_column :people, :assigned, :boolean
  end
end
