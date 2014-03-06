class AddUrlToRailgunPage < ActiveRecord::Migration
  def change
    add_column :railgun_pages, :url, :string, after: :slug
  end
end
