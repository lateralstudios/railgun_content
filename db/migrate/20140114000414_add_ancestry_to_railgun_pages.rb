class AddAncestryToRailgunPages < ActiveRecord::Migration
  def change
    add_column :railgun_pages, :ancestry, :string, after: :meta_description
    add_index :railgun_pages, :ancestry
  end
end
