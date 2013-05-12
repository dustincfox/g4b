class CheckIn < ActiveRecord::Base
  attr_accessible :checked_in_post_id, :content
  
  belongs_to :checked_in_user, class_name: "User"
  belongs_to :checked_in_post, class_name: "Post"

  validates :checked_in_user_id, presence: true
  validates :checked_in_post_id, presence: true   
end
