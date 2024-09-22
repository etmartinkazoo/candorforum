class Forum < ApplicationRecord
  has_many :users
  has_many :topics
  validates :name, :description, presence: true
end
