class CreateRailgunComponents < ActiveRecord::Migration
  def change
    create_table :railgun_components do |t|
      t.references :railgun_block
      t.string :type
      t.text :value
      t.string :alignment
      t.integer :position

      t.timestamps
    end
    add_index :railgun_components, :railgun_block_id
  end
end
