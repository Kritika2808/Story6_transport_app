class UserProfiles < ActiveRecord::Migration
  def change
  	add_column :users, :isAdmin, :boolean 
  	add_column :users, :isDailyUser, :boolean
  end
end
