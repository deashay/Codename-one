module Kinds
  class MapTile
    include Mongoid::Document

    field :name, type: String
    field :texture_path, type: String
  end
end
