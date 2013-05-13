class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  attr_accessible :content
  acts_as_voteable
  
  def nice_created_at
    self.created_at.strftime "%b %e, %l:%M%P"
  end  
end
