# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.role == 0
  end

  def show?
    user.role == 0
  end

  def create?
    user.role == 0
  end

  def new?
    create?
  end

  def update?
    user.role == 0
  end

  def edit?
    update?
  end

  def destroy?
    user.role == 0
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NoMethodError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
