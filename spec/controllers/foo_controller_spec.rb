require 'rails_helper'
include Devise::TestHelpers
describe FooController do
it "foo" do 
	user = User.create!(:email => "jiten@ads.com",:password =>"jitenjiten" , :isAdmin => false)
	sign_in :user, user
    get :bar
    expect(response.status).to eq(200)
end

end
