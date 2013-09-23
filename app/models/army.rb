class Army
  include Mongoid::Document

  belongs_to :map_tile
  belongs_to :country
  has_one :general, class_name: 'Noble'

  has_many :regiments

  field :name, type: String

  validates :name, presence: true, uniqueness: true
end
