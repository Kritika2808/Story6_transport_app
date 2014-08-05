namespace :export do
  desc "Seeds the data into the database"
  task :seeds_format => :environment do
    User.create(:email=>'adhoc@ads.com',:password=>'adhocadhoc',:isAdmin=>false, :name=>'Adhoc')
    User.create(:email=>'admin@ads.com',:password=>'adminadmin',:isAdmin=>false, :name=>'Admin')
    end
  end