class Railgun::ComponentImagesController < RailgunContent::ComponentsController

  model Railgun::ComponentImage

  actions :edit, :update, :show

  respond_to :js

end
