class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.integer :author_id

      t.timestamps
    end
    add_index :links, :author_id
  end
end
