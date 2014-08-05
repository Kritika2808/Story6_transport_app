class VariableNameChange < ActiveRecord::Migration
  def change
    rename_column :users, :isAdmin, :is_admin
    rename_column :users, :isDailyUser, :is_daily_user
  end
end
