class Railgun::ComponentGalleriesController < Railgun::ResourcesController

  model Railgun::ComponentGallery

  actions :edit, :update, :show

  respond_to :js

  def update
    params[:component_gallery][:asset_ids].reject(&:blank?).each_with_index do |id, index|
      resource.component_gallery_assets.find_or_create_by_asset_id(id).insert_at(index)
    end
    params[:component_gallery].delete(:asset_ids)
    update!
  end

end
