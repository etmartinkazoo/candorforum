class User < ApplicationRecord
  include Clearance::User

  enum :role, { admin: 0, moderator: 1, member: 2 }

  has_many :posts
  has_many :topics
  has_many :forums
end
