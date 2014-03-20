####
#### This is the RailgunContent instance
####
####
module RailgunContent
	class Application

		attr_accessor :components

    def initialize
      self.components = []
    end

		def add_component(controller)
      # TODO this is ridiculous
      component_name = controller.name.to_s.demodulize.gsub("Component", "").gsub("Controller", "").underscore.singularize
      self.components << component_name unless components.include?(component_name)
    end

	end
end
