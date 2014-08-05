class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit ,:update , :destroy]

  def index
    @users = User.all
    authorize @users
  end

  def new
    authorize User
    @user = User.new
  end

  def create
  	authorize User
    #authorize! :create, nil
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
  	authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
  	authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :fmno, :email, :password,:gender, :serviceline, :team, :extension_number, :address, :landmark, :mobile_no, :kin_mobile_number, :kin_name, :kin_relationship, :reporting_manager, :active, :is_admin)

    end
end