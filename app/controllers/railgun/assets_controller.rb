require 'railgun/resources_controller/searchable'

class Railgun::AssetsController < Railgun::ResourcesController

  model Railgun::Asset

  option :icon, "picture"

  actions :all

  respond_to :html, :js

  include Railgun::Searchable

  def index
    index! do
      add_action_button(:batch, "Upload Multiple", [:choose_multiple, resource_class], :type => "")
    end
  end

  def choose_multiple
    add_crumb(:title => "Upload multiple assets", :path => [:choose_multiple, resource_class] )
    set_title("Upload multiple assets")
  end
  collection_action :choose_multiple, :method => :get

  def upload_multiple
    files = params[:asset].try(:[], :files)
    redirect_to choose_multiple_assets_path, :alert => "Please select at least one file" and return if files.blank?
    assets_params = files.map {|file| {:image => file, :caption => ""} }
    uploaded_files = resource_class.create!(assets_params)
    @files_hash = uploaded_files.map do |asset|
      {
        :name => File.basename(asset.image.path),
        :size => asset.image.size,
        :url => asset.image.url,
        :thumbnail_url => asset.image.thumb.size,
        :delete_url => url_for(asset),
        :delete_type => "DELETE"
      }
    end
    respond_with(@files_hash) do |format|
      format.html { redirect_to assets_path, :notice => "#{@files_hash.count} images uploaded successfully" }
      format.json { render :json => {:files => @files_hash}}
    end
  end
  collection_action :upload_multiple, :method => :post

  def get_inline_caption_form
    respond_with(resource) do |format|
      format.html { render :partial => "inline_caption_form" }
    end
  end
  member_action :get_inline_caption_form, :method => :get

end
