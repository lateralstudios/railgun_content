class CreateRailgunAssets < ActiveRecord::Migration
  def change
    create_table :railgun_assets do |t|
      t.string :caption
      t.string :image

      t.timestamps
    end
  end
end
