class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :commentor_id
      t.integer :link_id

      t.timestamps
    end
    add_index :comments, [:commentor_id, :link_id]
  end
end
