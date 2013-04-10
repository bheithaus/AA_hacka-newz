class CreateLinkVotes < ActiveRecord::Migration
  def change
    create_table :link_votes do |t|
      t.integer :user_id
      t.integer :link_id
      t.integer :amount

      t.timestamps
    end
    add_index :link_votes, [:user_id, :link_id]
  end
end
