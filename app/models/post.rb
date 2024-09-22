class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_rich_text :content
  validates :content, presence: true
end
