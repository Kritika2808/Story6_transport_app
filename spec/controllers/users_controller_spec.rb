require 'rails_helper'

describe UsersController do

  let(:admin_user_attributes) {

    {:email => "admin@ads.com", :password => "adminadmin", :is_admin => true}
  }

  let(:adhoc_user_attributes) {

    {:email => "adhoc@ads.com", :password => "adhocadhoc", :is_admin => false, :is_daily_user => false}
  }

  describe "GET index" do
    it "fetches all users for logged in admin user" do
      user=User.create! admin_user_attributes
      User.create!(:email => "jiten_1@ads.com", :password => "jitenjiten", :is_admin => true)
      User.create!(:email => "jiten_2@ads.com", :password => "jitenjiten", :is_admin => true)
      User.create!(:email => "jiten_3@ads.com", :password => "jitenjiten", :is_admin => true)

      sign_in :user, user
      get :index
      all_users = User.all.to_a
      expect(assigns(:users)).to eq(all_users)
    end

    it "cannot fetch all users for non logged in users " do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      get :index
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  describe "GET new" do
    it "assigns a new user" do
      user = User.create! admin_user_attributes
      sign_in :user, user
      get :new, {:email => "jiten@ads.com", :password => "jitenjiten"}
      expect(assigns(:user)).to be_a_new(User)
    end

    it "cannot create a new user" do
      user = User.create! adhoc_user_attributes
      sign_in :user, user
      get :new, {:email => "jiten@ads.com", :password => "jitenjiten"}
      expect(response).to redirect_to(root_path)

    end
  end

  # describe "GET edit" do
  #   it "assigns the requested user as @user" do
  #     user = User.create! admin_user_attributes
  #     sign_in :user, user
  #     get :edit, {:id => user.to_param}, valid_session
  #     expect(assigns(:user)).to eq(user)
  #   end
  # end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        signed_in_user = User.create!(:email => "jiten@ads1.com", :password => "jitenjiten", :is_admin => true)
        sign_in :user, signed_in_user
        expect {
          post :create, {:user => admin_user_attributes}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        signed_in_user = User.create!(:email => "jiten@ads2.com", :password => "jitenjiten", :is_admin => true)
        sign_in :user, signed_in_user
        post :create, {:user => admin_user_attributes}
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        signed_in_user = User.create!(:email => "jiten@ads3.com", :password => "jitenjiten", :is_admin => true)
        sign_in :user, signed_in_user
        post :create, {:user => admin_user_attributes}
        expect(response).to redirect_to(User.last)
      end
    end

    describe "not an admin user" do
      it "should not add the new User" do
        signed_in_user = User.create! adhoc_user_attributes
        sign_in :user, signed_in_user
        expect {
            post :create, {:user => admin_user_attributes}
        }.to_not change(User, :count)
      end
      it "doesnt assigns a newly created user as @user" do
        signed_in_user = User.create! adhoc_user_attributes
        sign_in :user, signed_in_user
          post :create, {:user => admin_user_attributes}
        expect(assigns(:user)).to_not be_a(User)
      end
      it "cannot create an user" do
        signed_in_user = User.create! adhoc_user_attributes
        sign_in :user, signed_in_user
        post :create, {:user => admin_user_attributes}
        expect(response).to redirect_to(root_path)
      end

    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {:email => "jiten@ads.com", :password => "jitenjiten", :is_admin => false}
      }

      it "updates the requested user" do
        signed_in_user = User.create! admin_user_attributes
        sign_in :user, signed_in_user
        user = User.create!(:email => "shriram@ads.com", :password => "shriramshriram", :is_admin => false)
        put :update, {:id => user.to_param, :user => new_attributes}
        user.reload
        expect(assigns(:user)).to eq(user)
      end

      it "assigns the requested user as @user" do
        user = User.create! admin_user_attributes
        sign_in :user, user
        put :update, {:id => user.to_param, :user => admin_user_attributes}
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = User.create! admin_user_attributes
        sign_in :user, user
        put :update, {:id => user.to_param, :user => admin_user_attributes}
        expect(response).to redirect_to(user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! admin_user_attributes
        sign_in :user, user
        put :update, {:id => user.to_param, :user => adhoc_user_attributes}
        expect(assigns(:user)).to eq(user)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      signed_in_user = User.create! admin_user_attributes
      sign_in :user, signed_in_user
      user = User.create! adhoc_user_attributes
      expect {
        delete :destroy, {:id => user.id}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! admin_user_attributes
      sign_in :user, user
      delete :destroy, {:id => user.id}
      expect(response).to redirect_to(users_url)
    end
  end

  context "View rendering" do
    render_views
    it "should render the index page" do
      user = User.create! admin_user_attributes
      sign_in :user, user
      get :index
    end
    it "should render the new user page" do
      user = User.create! admin_user_attributes
      sign_in :user, user
      get :new
    end
    it "should render the create user page" do
      user = User.create! admin_user_attributes
      sign_in :user, user
      post :create, {:user => admin_user_attributes}
    end
  end
end