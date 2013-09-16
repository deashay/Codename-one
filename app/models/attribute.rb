class Attribute
  include Mongoid::Document

  belongs_to :attributable, polymorphic: true

  field :value, type: Float
end