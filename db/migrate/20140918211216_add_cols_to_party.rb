class AddColsToParty < ActiveRecord::Migration
  def change
    add_column :parties, :preference, :int
    add_column :parties, :status, :string
    add_column :parties, :min_size, :string
    add_column :parties, :max_size, :string
  end
end
