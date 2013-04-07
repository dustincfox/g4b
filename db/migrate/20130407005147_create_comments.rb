class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :commentable

      t.timestamps
    end
    add_index :comments, :commentable_id
  end
end
