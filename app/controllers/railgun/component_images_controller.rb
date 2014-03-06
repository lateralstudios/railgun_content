class Railgun::ComponentImagesController < Railgun::ResourcesController

  model Railgun::ComponentImage

  actions :edit, :update, :show

  respond_to :js

end
