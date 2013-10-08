class Resource
  include Mongoid::Document

  belongs_to :global_configuration
  belongs_to :world, inverse_of: :starting_resources
  belongs_to :kind, class_name: 'Kinds::Resource', inverse_of: nil

  field :amount, type: Integer, default: 0

  delegate :name, to: :kind
end
