class UserPolicy < ApplicationPolicy

  def index?
	#@user.isAdmin?||@user.isDailyUser?
    true
  end
  def show?
  	@user.admin?
  end

  alias_method :new?, :show?
  # def new?
  # 	@user.admin?
  # end
  def edit?
  	@user.admin?
  end
  def create?
  	@user.admin?
  end
  def update?
  	@user.admin?
  end
  def destroy?
  	@user.admin?
  end

end