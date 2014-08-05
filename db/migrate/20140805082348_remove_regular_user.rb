class RemoveRegularUser < ActiveRecord::Migration
  def change
    remove_column :users, :regular_user
  end
end
