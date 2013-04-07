class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :title
      t.text :desc
      t.string :location
      t.datetime :starts_at
      t.date :happening_on
      t.references :user

      t.timestamps
    end
    add_index :actions, :user_id
  end
end
