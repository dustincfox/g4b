class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :posts
  has_many :commitments, foreign_key: "committed_user_id", dependent: :destroy
  has_many :committed_tos, through: :commitments, source: "commitment"

  has_many :comments, as: :commentable
  has_many :check_ins, foreign_key: "checked_in_user_id", dependent: :destroy
  has_many :checked_in_posts, through: :check_ins, source: "checked_in_post"

  acts_as_voter
  # has_karma(:check_ins)
  has_karma(:comments)

  def committed_to?(post)
    return commitments.find_by_commitment_id(post.id).present?
  end
  
  def commit!(post)
    commitments.create!(commitment_id: post.id)
  end  

  def reneg!(commitment)
    commitments.find(commitment.id).destroy
  end

  def check_in!(post, content)
    check_ins.create!(checked_in_post_id: post.id, content: content)
  end

  def checked_in?(post)
    check_in = check_ins.find_by_checked_in_post_id(post.id)
    return check_in.present? && check_in.created_at > Time.now - 1.day
  end
end
