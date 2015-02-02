class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  validates :link_id, presence: true
  validates :user_id, presence: true
end
