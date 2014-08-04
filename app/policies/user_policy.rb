class UserPolicy < ApplicationPolicy

  def index?
	@user.isAdmin?||@user.isDailyUser?
  end
  def show?
  	@user.isAdmin?
  end
  def new?
  	@user.admin?
  end
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