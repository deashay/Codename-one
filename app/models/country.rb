class Country
  include Mongoid::Document

  belongs_to :owner, class_name: 'User'
  belongs_to :world
  has_many :armies
  has_many :cities
  has_many :lands, class_name: 'MapTile'
  has_many :nobles
  has_one :king, class_name: 'Noble'

  field :name, type: String

  validates :name, presence: true, uniqueness: true
end
