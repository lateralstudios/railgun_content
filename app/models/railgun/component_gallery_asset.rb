class Railgun::ComponentGalleryAsset < ActiveRecord::Base
    belongs_to :component_gallery
    belongs_to :asset

    attr_accessible :component_gallery_id, :asset_id

    acts_as_list scope: :component_gallery
end
