class Railgun::ComponentImage < ActiveRecord::Base
  
  has_one :component, as: :contentable
  belongs_to :asset

  attr_accessible :asset_id

  def to_s
    "Image"
  end

end
