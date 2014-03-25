class Railgun::ComponentGallery < ActiveRecord::Base
  has_and_belongs_to_many :assets, join_table: :railgun_assets_component_galleries
end

class ConvertRailgunAssetsComponentGalleriesToThroughTable < ActiveRecord::Migration
  def up
    create_table :railgun_component_gallery_assets do |t|
      t.integer :component_gallery_id, index: true, null: false
      t.integer :asset_id, index: true, null: false
      t.integer :position
      t.timestamps
    end

    Railgun::ComponentGallery.find_each do |gallery|
      gallery.assets.each do |asset|
        Railgun::ComponentGalleryAsset.create!(:component_gallery_id => gallery.id, :asset_id => asset.id )
      end
    end

    drop_table :railgun_assets_component_galleries
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
