class CreateRailgunPages < ActiveRecord::Migration
  def change
    create_table :railgun_pages do |t|
      t.string :name
      t.string :slug
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_description
      t.integer :position

      t.timestamps
    end
  end
end
