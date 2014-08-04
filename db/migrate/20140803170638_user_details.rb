class UserDetails < ActiveRecord::Migration
  	def change
    add_column :users, :name, :string
    add_column :users, :fmno, :string
    add_index :users, :fmno
    add_column :users, :gender, :string
    add_column :users, :serviceline, :string
    add_column :users, :team, :string
    add_column :users, :extension_number, :string
    add_column :users, :address, :text
    add_column :users, :landmark, :string
    add_column :users, :mobile_no, :integer
    add_column :users, :kin_mobile_number, :integer
    add_column :users, :kin_name, :string
    add_column :users, :kin_relationship, :string
    add_column :users, :reporting_manager, :string
    add_column :users, :regular_user, :boolean
    add_column :users, :active, :boolean
  end
end
