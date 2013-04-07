class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.string :content
      t.references :action

      t.timestamps
    end
    add_index :check_ins, :action_id
  end
end
