class Group
  include Mongoid::Document

  belongs_to :owner, polymorphic: true
  has_one :race
  has_one :nationality

  field :gender, type: Boolean
  field :count, type: Integer, default: 0
  field :used, type: Integer, default: 0
end
