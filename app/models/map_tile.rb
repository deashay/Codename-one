class MapTile
  include Mongoid::Document

  belongs_to :influencing_city, class_name: 'City'
  belongs_to :country, inverse_of: :lands
  
  has_many :armies
  has_many :cities
  has_many :buildings
end
