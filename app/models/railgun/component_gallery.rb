class Railgun::ComponentGallery < ActiveRecord::Base

  has_one :component, as: :contentable
  has_many :component_gallery_assets, :order => :position
  has_many :assets, through: :component_gallery_assets, :order => :position

  belongs_to :cover_image, class_name: "Railgun::Asset"

  attr_accessible :title, :cover_image_id, :asset_ids

  validates :title, :cover_image, presence: true

  def to_s
    "Gallery"
  end

end
