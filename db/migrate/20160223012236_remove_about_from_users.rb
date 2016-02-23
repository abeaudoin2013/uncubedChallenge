class RemoveAboutFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :about, :text
  end
end
