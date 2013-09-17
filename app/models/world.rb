class World
  include Mongoid::Document

  has_many :users
  has_many :map_tiles
  has_many :countries

  field :name, type: String
end