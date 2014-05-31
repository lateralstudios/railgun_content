class AddHideFromNavToRailgunPages < ActiveRecord::Migration
  def change
    add_column :railgun_pages, :hide_from_nav, :boolean,
               default: false, after: :position
  end
end
