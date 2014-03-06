class Railgun::ComponentGallery < ActiveRecord::Base

  has_one :component, as: :contentable
  has_and_belongs_to_many :assets, :join_table => :railgun_assets_component_galleries

  belongs_to :cover_image, class_name: "Railgun::Asset"

  attr_accessible :title, :cover_image_id, :asset_ids

  validates :title, :cover_image, presence: true

  def to_s
    "Gallery"
  end

end
