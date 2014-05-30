require 'railgun/resources_controller/positionable'

class Railgun::ComponentsController < Railgun::ResourcesController

  model Railgun::Component

  # belongs_to :page

  actions :all, except: [:index]

  include Railgun::Positionable

  respond_to :js

  def update_position
    resource.update_attribute(:alignment, params[:alignment]) if params[:alignment]
    super
  end

end
