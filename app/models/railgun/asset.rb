class Railgun::Asset < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  attr_accessible :caption, :image

  validates :caption, :image, :presence => true

  before_validation :guess_caption

  scope :search, ->(keywords){ where("caption LIKE ?", "%#{keywords}%") }

  def to_s
    caption
  end

private

  def guess_caption
    self.caption = self.caption.presence
    self.caption ||= File.basename(image.path, ".*").gsub("_", " ") if image.path
  end

end
