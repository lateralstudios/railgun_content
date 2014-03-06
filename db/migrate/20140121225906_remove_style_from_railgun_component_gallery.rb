class RemoveStyleFromRailgunComponentGallery < ActiveRecord::Migration
  def up
    remove_column :railgun_component_galleries, :style
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
