class City
  include Mongoid::Document

  belongs_to :map_tile
  belongs_to :country
  has_many :citizen, class_name: 'Group', inverse_of: :owner
  has_many :buildings
  has_many :influenced_tiles, class_name: 'MapTile', inverse_of: :influencing_city
end