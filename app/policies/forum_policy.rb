class ForumPolicy < ApplicationPolicy
  attr_reader :user, :forum

  def initialize(user, forum)
    @user = user
    @forum = forum
  end

  def index?
    user.role == 0 || user.role == 1 || user.role == 2
  end

  def show
    user.role == 0 || user.role == 1 || user.role == 2
  end
end
