class CreateActionsTagsTable < ActiveRecord::Migration
  def self.up
    create_table :actions_tags, :id => false do |t|
        t.references :action
        t.references :tag
    end
    add_index :actions_tags, [:action_id, :tag_id]
    add_index :actions_tags, [:tag_id, :action_id]
  end

  def self.down
    drop_table :actions_tags
  end
end
