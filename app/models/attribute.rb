class Attribute
  include Mongoid::Document

  belongs_to :attributable, polymorphic: true
  belongs_to :kind, class_name: 'Kinds::Attribute', inverse_of: nil

  field :value, type: Float

  validates :value, numericality: { greater_than_or_equal: 0 }

  scope :of_kind, ->(kind_id) { where(kind_id: kind_id) }
end
