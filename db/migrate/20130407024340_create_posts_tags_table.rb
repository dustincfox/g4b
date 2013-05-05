class CreatePostsTagsTable < ActiveRecord::Migration
  def self.up
    create_table :posts_tags, :id => false do |t|
        t.references :post
        t.references :tag
    end
    add_index :posts_tags, [:post_id, :tag_id]
    add_index :posts_tags, [:tag_id, :post_id]
  end

  def self.down
    drop_table :posts_tags
  end
end