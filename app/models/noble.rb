class Noble < Attributable
  include Mongoid::Document

  belongs_to :country
  belongs_to :army
  belongs_to :regiment
  belongs_to :race
  has_one :rulled_country, class_name: 'Country', inverse_of: :king

end