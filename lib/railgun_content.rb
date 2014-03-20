require "carrierwave"
require "mini_magick"
require "ancestry"
require "friendly_id"
require "acts_as_list"
require "jquery-ui-rails"
require "redactor-rails"
require "remotipart"

require "railgun_content/application"
require "railgun_content/engine"

module RailgunContent

  class << self
    attr_accessor :application

    def application
    	@application ||= ::RailgunContent::Application.new
    end
	end

  def self.components
    application.components
  end



end
