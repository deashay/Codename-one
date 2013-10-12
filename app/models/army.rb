class Army
  include Mongoid::Document

  after_save :recalculate_can_lift

  belongs_to :map_tile
  belongs_to :country

  has_one :general, class_name: 'Noble'
  has_one :race

  has_many :regiments
  has_many :resources, as: :acquired_resources

  field :name, type: String
  field :can_lift, type: Integer, default: 0

  validates :name, presence: true, uniqueness: true
  validates :can_lift, numericality: { greater_than_or_equal_to: 0 }
  validates :race, presence: true

  def recalculate_can_lift
    weigth_for_army = self.regiments.groups.pluck(:count).inject(0, :+)
    self.update_attributes(:can_lift, weigth_for_army * self.race.strength)
  end
end
