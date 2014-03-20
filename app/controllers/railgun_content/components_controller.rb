class RailgunContent::ComponentsController < Railgun::ResourcesController

  def self.inherited(base)
    super(base)
    RailgunContent.application.add_component(base)
  end

end
