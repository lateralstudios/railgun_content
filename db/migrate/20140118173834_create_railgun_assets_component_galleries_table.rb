class CreateRailgunAssetsComponentGalleriesTable < ActiveRecord::Migration
  def change
    create_table :railgun_assets_component_galleries, :id => false do |t|
        t.references :railgun_asset
        t.references :railgun_component_gallery
    end
    add_index :assets_component_galleries, [:railgun_asset_id, :railgun_component_gallery_id],
      :name => 'index_assets_component_galleries_asset_component_gallery'
    add_index :assets_component_galleries, :railgun_component_gallery_id
  end
end
