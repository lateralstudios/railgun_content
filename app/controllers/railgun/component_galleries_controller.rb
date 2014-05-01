class Railgun::ComponentGalleriesController < RailgunContent::ComponentsController

  model Railgun::ComponentGallery

  actions :edit, :update, :show

  respond_to :js

end
