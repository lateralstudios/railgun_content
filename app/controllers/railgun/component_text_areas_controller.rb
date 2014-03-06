class Railgun::ComponentTextAreasController < Railgun::ResourcesController

  model Railgun::ComponentTextArea

  actions :edit, :update, :show

  respond_to :js

end
