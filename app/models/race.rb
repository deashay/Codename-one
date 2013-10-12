class Race < Attributable
  include Mongoid::Document

  belongs_to :user
  has_and_belongs_to_many :origins, class_name: 'Race', inverse_of: :succesors
  has_and_belongs_to_many :succesors, class_name: 'Race', inverse_of: :origins
  has_many :people, class_name: 'Group'
  has_many :nobles

  field :name, type: String
  field :active, type: Boolean, default: false
  field :strength, type: Float, default: 50.0

  validates :name, presence: true, uniqueness: true
  validates :strength, numericality: true, inclusion: (0..100)

  scope :active, ->{ where(active: true) }
end
