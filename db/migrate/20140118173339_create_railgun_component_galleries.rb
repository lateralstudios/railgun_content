class CreateRailgunComponentGalleries < ActiveRecord::Migration
  def change
    create_table :railgun_component_galleries do |t|
      t.string :style

      t.timestamps
    end
  end
end
