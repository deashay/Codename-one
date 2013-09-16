class Perk
  include Mongoid::Document

  belongs_to :perk_kind
  belongs_to :attributable, polymorphic: true
end