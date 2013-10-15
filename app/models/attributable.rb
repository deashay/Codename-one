class Attributable
  include Mongoid::Document

  has_many :skills, class_name: 'Attribute'
  has_many :stats, class_name: 'Attribute'
  has_many :perks

  field :morale, type: Float
end
