#User Model
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   def admin?
   	self.isAdmin?
   end

   def daily_user?
   	self.isDailyUser?
   end
end
