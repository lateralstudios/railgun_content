module RailgunContent
  class Engine < ::Rails::Engine

    def self.integrate_with_railgun
      add_to_railgun
      register_assets
    end

    def self.add_to_railgun
      Railgun.config.load_paths << File.expand_path('app/controllers/railgun', root)
      Railgun.application.reload_railgun!
    end

    def self.register_assets
      Railgun.config.register_stylesheets += %w(redactor-rails chosen railgun_content/application)
      Railgun.config.register_javascripts += %w(redactor-rails chosen-jquery
      railgun_content/application)
    end

    config.to_prepare &method(:integrate_with_railgun).to_proc
  end
end

# Railgun.configure do |config|
#   config.load_paths << File.expand_path('app/controllers/railgun', RailgunContent::Engine.root)
# end
