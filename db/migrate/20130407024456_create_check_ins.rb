class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.string :content
      t.integer :checked_in_user_id
      t.integer :checked_in_post_id

      t.timestamps
    end

    add_index :check_ins, :checked_in_user_id
    add_index :check_ins, :checked_in_post_id
    add_index :check_ins, [:checked_in_user_id, :checked_in_post_id]

  end
end