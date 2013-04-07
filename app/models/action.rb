class Action < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments, as: :commentable
  attr_accessible :desc, :happening_on, :location, :title
end
