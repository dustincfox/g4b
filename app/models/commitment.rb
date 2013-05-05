class Commitment < ActiveRecord::Base
  attr_accessible :commitment_id
  
  belongs_to :commited_user, class_name: "User"
  belongs_to :commitment, class_name: "Post"

  validates :commited_user_id, presence: true
  validates :commitment_id, presence: true    
end