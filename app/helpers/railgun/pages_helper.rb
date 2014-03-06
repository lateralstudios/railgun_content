module Railgun::PagesHelper

  def nested_page_list top_level, &block
    content_tag :ul, :class => "pages" do
      top_level.map do |parent, children|
        content_tag :li, :role => parent.id, :data => {update_position_path: update_position_page_path(parent)} do
          contents = []
          contents << block.call(parent) if block_given?
          if children.any?
            contents << nested_page_list(children, &block)
          end
         contents.reduce(:<<) 
        end
      end.reduce(:<<)
    end
  end

  def nested_page_options items, current_item, &block
    options = []
    items.each do |item, children|
      next if item == current_item
      options << [yield(item), item.id]
      options += nested_page_options(children, current_item, &block)
    end
    options
  end

end