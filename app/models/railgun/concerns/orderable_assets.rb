module Railgun
  module Concerns
    module OrderableAssets

      def asset_ids=(ids)
        through_class = "#{self.class.to_s.demodulize.underscore}_assets".to_sym
        ids = Array(ids).reject { |id| id.blank? }
        ids.map! { |i| i.to_i }
        ids.each_with_index do |id, index|
          self.send(through_class).find_or_create_by_asset_id(id).insert_at(index)
        end
        to_delete = self.send(through_class).map(&:asset_id) - ids
        self.send(through_class).where(:"#{self.class.to_s.demodulize.underscore}_id" => self.id, :asset_id => to_delete).destroy_all
      end

    end
  end
end
