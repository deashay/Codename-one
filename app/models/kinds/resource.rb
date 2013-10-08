module Kinds
  class Resource
    include Mongoid::Document

    has_many :necessary_resources, class_name: 'Resource',
      inverse_of: :required_in_resource, dependent: :destroy

    field :name, type: String
    field :weight, type: Float, default: 1
    field :normal_output, type: Float, default: 1

    accepts_nested_attributes_for :necessary_resources
  end
end
