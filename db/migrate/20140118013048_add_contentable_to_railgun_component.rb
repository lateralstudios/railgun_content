class AddContentableToRailgunComponent < ActiveRecord::Migration
  def change
    add_column :railgun_components, :contentable_id, :integer, after: :position
    add_column :railgun_components, :contentable_type, :string, after: :contentable_id
    remove_column :railgun_components, :type
    remove_column :railgun_components, :value
  end
end
