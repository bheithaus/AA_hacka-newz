class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :ancestor_id
      t.integer :descendant_id

      t.timestamps
    end
  end
end
