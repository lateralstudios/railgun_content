class CreateRailgunComponentTextAreas < ActiveRecord::Migration
  def change
    create_table :railgun_component_text_areas do |t|
      t.text :value

      t.timestamps
    end
  end
end
