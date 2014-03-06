class Railgun::PagesController < Railgun::ResourcesController

  model Railgun::Page

  option :icon, "file"

  actions :all, :except => [:show]

  attributes :meta_title, :meta_description, :meta_keywords, :viewable => false
  attributes :ancestry, :position, :viewable => false, :editable => false

  attributes :parent_id, :type => "nested_set", :viewable => false

  def create
    create! do |success, failure|
      success.html{ redirect_to [:edit, resource] }
    end
  end

  def update
    update! do |success, failure|
      success.html{ redirect_to [:edit, resource] }
    end
  end

  def update_position
    resource.insert_at(params[:insert_at].to_i)
    render nothing: true
  end
  member_action :update_position, :method => :put

  def collection
    inherited_chain
  end

end
