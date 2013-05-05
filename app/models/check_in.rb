class CheckIn < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comments, as: :commentable
  attr_accessible :content
end
