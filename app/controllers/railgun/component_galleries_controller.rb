class Railgun::ComponentGalleriesController < Railgun::ResourcesController

  model Railgun::ComponentGallery

  actions :edit, :update, :show

  respond_to :js

end
