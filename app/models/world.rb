class World
  include Mongoid::Document

  has_many :map_tiles
  has_many :countries
end