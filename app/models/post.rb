class Post < ActiveRecord::Base
  belongs_to :user
  has_many :committed_users, through: :commitments

  has_many :comments, as: :commentable
  has_many :check_ins, as: :checkinable
  has_and_belongs_to_many :tags

  attr_accessible :desc, 
                  :happening_on, 
                  :location, 
                  :starts_at, 
                  :title, 
                  :video_url, 
                  :img_url, 
                  :tag_list

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def is_committed_to_by?(user)
    return self.committed_user.find_by_committed_user_id(user.id).present?
  end
end
