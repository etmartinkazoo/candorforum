class TopicPolicy < ApplicationPolicy
  attr_reader :user, :topic

  def initialize(user, topic)
    @user = user
    @topic = topic
  end

  def index?
    user.role == 0 || user.role == 1 || user.role == 2
  end

  def show
    user.role == 0 || user.role == 1 || user.role == 2
  end
end
