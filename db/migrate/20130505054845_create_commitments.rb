class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.integer :committed_user_id
      t.integer :commitment_id

      t.timestamps
    end
    add_index :commitments, :committed_user_id
    add_index :commitments, :commitment_id
    add_index :commitments, [:committed_user_id, :commitment_id], unique: true
  end
end
