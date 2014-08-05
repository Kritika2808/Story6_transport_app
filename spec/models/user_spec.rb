require 'rails_helper'

describe User do 

	it "should be an administrator" do
	user=User.create(:email=>"admin@ads.com",:password=>"adminadmin",:is_admin =>true,:is_daily_user =>false)
	expect(user.admin?).to eq(true)
	end

	it "should be a daily user" do
	user=User.create(:email=>"admin@ads.com",:password=>"adminadmin",:is_daily_user =>true)
	expect(user.daily_user?).to eq(true)
	end

	it "should not be an administrator" do
	user=User.create(:email=>"admin@ads.com",:password=>"adminadmin",:is_admin =>false,:is_daily_user =>false)
	expect(user.admin?).to eq(false)
	end

	it "should not be a daily user" do
	user=User.create(:email=>"admin@ads.com",:password=>"adminadmin",:is_daily_user =>false)
	expect(user.daily_user?).to eq(false)
	end
end
