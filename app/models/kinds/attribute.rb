module Kinds
  class Attribute
    include Mongoid::Document

    field :name, type: String
  end
end
