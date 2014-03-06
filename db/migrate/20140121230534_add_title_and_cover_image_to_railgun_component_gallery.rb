class AddTitleAndCoverImageToRailgunComponentGallery < ActiveRecord::Migration
  def change
    add_column :railgun_component_galleries, :title, :string, after: :id
    add_column :railgun_component_galleries, :cover_image_id, :integer, after: :title
  end
end
