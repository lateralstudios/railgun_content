class Railgun::ComponentTextAreasController < RailgunContent::ComponentsController

  model Railgun::ComponentTextArea

  actions :edit, :update, :show

  respond_to :js

end
