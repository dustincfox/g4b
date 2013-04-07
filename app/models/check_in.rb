class CheckIn < ActiveRecord::Base
  belongs_to :action
  has_many :comments, as: :commentable
  attr_accessible :content
end
