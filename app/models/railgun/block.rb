class Railgun::Block < ActiveRecord::Base

  belongs_to :page
  has_many :components, dependent: :destroy

  acts_as_list scope: :page

  attr_accessible :page, :page_id, :position, :template

  TEMPLATES = %w(single big_left half big_right)

  validates :page, :template, :presence => true
  validates :template, inclusion: { in: TEMPLATES }

  scope :ordered, order("position ASC")

  after_save :align_unaligned_components!

  def alignable?
    alignments.any?
  end

  def alignments
    case template
    when "single"
      []
    else
      ["left", "right"]
    end
  end

  private

  def align_unaligned_components!
    if template_changed? && alignments.any?
      components.not_aligned.each do |component|
        component.alignment = alignments.first
        component.save!
      end
    end
  end

end
