class Railgun::Component < ActiveRecord::Base

  belongs_to :block

  belongs_to :contentable, polymorphic: true, dependent: :destroy

  TYPES = %w(text_area button image promotion slideshow gallery testimonial map embed)

  acts_as_list scope: [:block_id, :alignment]

  attr_accessible :position, :alignment, :block, :block_id, :type

  attr_writer :type

  scope :aligned, lambda{|alignment| where(:alignment => alignment)}
  scope :ordered, order("position ASC")

  before_create :assign_contentable

  validates :type, inclusion: { in: TYPES }, allow_nil: true

  def aligned?
    block.alignable? && alignment.present?
  end

  def type
    @type || (contentable ? contentable.class.to_s.demodulize.underscore.gsub("component_", "") : nil)
  end

  def to_s
    contentable ? contentable.to_s : "Component"
  end

private

  def assign_contentable
    contentable_class = ("Railgun::"+("component_#{type}".classify)).constantize
    content = contentable_class.new
    content.save(:validate => false)
    self.contentable = content
  end

end
