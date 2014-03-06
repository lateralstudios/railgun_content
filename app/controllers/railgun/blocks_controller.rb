class Railgun::BlocksController < Railgun::ResourcesController

  model Railgun::Block

  #belongs_to :page

  actions :all, except: [:index]

  respond_to :js

  def update_position
    resource.insert_at(params[:insert_at].to_i)
    render nothing: true
  end
  member_action :update_position, :method => :put

end
