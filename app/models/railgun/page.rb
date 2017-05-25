class Railgun::Page < ActiveRecord::Base

  has_many :blocks, dependent: :destroy

  belongs_to :header_banner, class_name: "Asset"
  belongs_to :footer_banner, class_name: "Asset"

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_ancestry

  acts_as_list scope: [:ancestry]

  scope :ordered, order("position ASC")

  scope :in_main_nav, where(hide_from_nav: false)

  attr_accessible :meta_description, :meta_keywords, :meta_title, :name, :slug, :position,
    :parent_id, :hide_from_nav, :header_banner_id, :footer_banner_id

  validates :name, :slug, :presence => true

  before_save :update_url
  before_save :update_position, if: :ancestry_changed?

  def home?
    root? && slug == "home"
  end

  def absolute_url
    "/#{url}"
  end

  def generate_url!
    self.url = generate_url
    save!
  end

  def generate_url
    slug_tree.join("/")
  end

  def should_generate_new_friendly_id?
    new_record?
  end

private

  def update_position
    return true if new_record?
    # I would love to use acts_as_list .move_to_bottom here.. but it doesn't work
    self.position = 0
    self.position = (parent || self).siblings.maximum(:position) + 1
    return true
  end

  def update_url
    if slug_changed? || ancestry_changed?
      self.url = generate_url
    end
    return true
  end

  def slug_tree child=self
    slugs = []
    slugs << child.slug
    slugs << slug_tree(child.parent) unless child.root?
    slugs.reverse
  end

end
