class MapTile
  include Mongoid::Document

  field :x, type: Integer
  field :y, type: Integer

  belongs_to :world
  belongs_to :influencing_city, class_name: 'City'
  belongs_to :country, inverse_of: :lands

  has_many :armies
  has_many :cities
  has_many :buildings

  validates :world, presence: true
end
