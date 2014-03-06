class CreateRailgunBlocks < ActiveRecord::Migration
  def change
    create_table :railgun_blocks do |t|
      t.references :railgun_page
      t.string :template
      t.integer :position

      t.timestamps
    end
  end
end
