class RemoveProgressFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :progress, :integer
  end
end
