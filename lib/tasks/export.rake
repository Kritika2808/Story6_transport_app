namespace :export do
  desc "Seeds the data into the database"
  task :seeds_format => :environment do
    User.create(:email=>'adhoc@ads.com',:password=>'adhocadhoc',:isAdmin=>false, :name=>'Adhoc')
    end
  end