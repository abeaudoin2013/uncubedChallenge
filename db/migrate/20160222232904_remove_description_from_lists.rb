class RemoveDescriptionFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :description, :text
  end
end
