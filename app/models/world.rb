class World
  include Mongoid::Document

  has_many :users
  has_many :map_tiles
  has_many :countries

  field :name, type: String
  field :width, type: Integer
  field :height, type: Integer

  validates :name, presence: true, uniqueness: true
  validates_numericality_of :width, greater_than: 0
  validates_numericality_of :height, greater_than: 0

  def generate_map
    (width*height).times{ self.map_tiles.create }
  end
end
