class CreateRailgunComponentImages < ActiveRecord::Migration
  def change
    create_table :railgun_component_images do |t|
      t.references :railgun_asset

      t.timestamps
    end
    add_index :railgun_component_images, :railgun_asset_id
  end
end
