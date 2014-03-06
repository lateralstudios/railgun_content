class Railgun::Block < ActiveRecord::Base

  belongs_to :page
  has_many :components, dependent: :destroy

  acts_as_list scope: :page

  attr_accessible :page, :page_id, :position, :template

  TEMPLATES = %w(single big_left half big_right)

  validates :page, :template, :presence => true
  validates :template, inclusion: { in: TEMPLATES }

  scope :ordered, order("position ASC")

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

end
