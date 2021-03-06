require 'railgun/resources_controller/positionable'

module RailgunContent
  module Page

    def self.included(base)
      base.instance_eval do

    		option :icon, "file"

        actions :all, :except => [:show]

        attributes :meta_title, :meta_description, :meta_keywords, :viewable => false
        attributes :ancestry, :position, :viewable => false, :editable => false

        attributes :parent_id, :type => "nested_set", :viewable => false
      end
    end

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

    protected

    def collection
      @pages ||= end_of_railgun_chain
    end
  end
end
