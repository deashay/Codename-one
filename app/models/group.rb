class Group
  include Mongoid::Document

  belongs_to :owner, polymorphic: true
  belongs_to :race, inverse_of: :people
  has_one :nationality

  field :gender, type: Boolean
  field :count, type: Integer, default: 0
  field :used, type: Integer, default: 0

  delegate :stats, to: :race
end
