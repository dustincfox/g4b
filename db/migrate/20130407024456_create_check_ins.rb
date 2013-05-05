class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.string :content
      t.references :post
      t.references :user
      t.references :checkinable

      t.timestamps
    end
    add_index :check_ins, :post_id
    add_index :check_ins, :user_id
  end
end