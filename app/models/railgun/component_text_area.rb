class Railgun::ComponentTextArea < ActiveRecord::Base

  has_one :component, as: :contentable

  attr_accessible :value

  def to_s
    "Text area"
  end
end
