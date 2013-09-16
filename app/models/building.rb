class Building
  include Mongoid::Document

  belongs_to :city
  belongs_to :map_tile

  has_many :workers, class_name: 'Group', inverse_of: :owner
end