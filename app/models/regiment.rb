class Regiment < Attributable
  include Mongoid::Document

  belongs_to :army

  has_many :soldiers, class_name: 'Group', inverse_of: :owner
  has_one :officer, class_name: 'Noble'


  field :name, type: String

  validates :name, presence: true, uniqueness: true
end
