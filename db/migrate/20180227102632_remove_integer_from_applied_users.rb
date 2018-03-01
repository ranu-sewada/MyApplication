class RemoveIntegerFromAppliedUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :applied_users, :integer, :character
  end
end
