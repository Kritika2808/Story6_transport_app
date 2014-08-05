# require 'rails_helper'
# require "pundit/rspec"
# describe UserPolicy do
#   subject { UserPolicy.new(user,post) }
#   describe "with a global admin user" do
#     user = User.create(:email => "jiten@ads.com", :password => "jitenjiten", :is_admin => true)
#
#     it { should permit(:show) }
#     it { should permit(:edit) }
#     it { should permit(:update) }
#     it { should permit(:index)}
#   end
#   #
#   # permissions :create? do
#   #   it "denies access if user is not admin" do
#   #     expect(subject).not_to permit(User.create(:email => "shriram@ads.com", :password => "shriramshriram",:is_admin => false), User.create(:email => "jiten@ads.com", :password => "jitenjiten"))
#   #   end
#   #
#   #   it "grants access if post is published and user is an admin" do
#   #     expect(subject).to permit(User.new(:admin => true), Post.new(:published => true))
#   #   end
#   #
#   #   it "grants access if post is unpublished" do
#   #     expect(subject).to permit(User.new(:admin => false), Post.new(:published => false))
#   #   end
#   #end
# end