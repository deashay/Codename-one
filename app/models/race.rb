class Race < Attributable
  include Mongoid::Document

  belongs_to :user
  belongs_to :race, inverse_of: :race
  has_and_belongs_to_many :origins, class_name: 'Race', inverse_of: :succesors
  has_and_belongs_to_many :succesors, class_name: 'Race', inverse_of: :origins
  has_many :people, class_name: 'Group'
  has_many :nobles

  field :name, type: String
  field :active, type: Boolean, default: false

  validates :name, presence: true, uniqueness: true

  scope :active, ->{ where(active: true) }

  delegate :attributes, to: :group
end
