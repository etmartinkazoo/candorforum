class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    user.role == 0 || user.role == 1 || user.role == 2
  end

  def show
    user.role == 0 || user.role == 1 || user.role == 2
  end

  def create
    user.role == 0 || user.role == 1 || user.role == 2
  end

  def destroy
    user.role == 0
  end
end
