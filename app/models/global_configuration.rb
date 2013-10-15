class GlobalConfiguration
  include Mongoid::Document

  has_many :starting_resources, class_name: 'Resource', dependent: :destroy
  has_many :worlds

  belongs_to :weigth_attribute, class_name: 'Kinds::Attribute', inverse_of: nil

  field :starting_units, type: Integer, default: 50
  field :is_global, type: Boolean, default: false

  accepts_nested_attributes_for :starting_resources

  scope :global, ->{ where(is_global: true) }
end
