class Army
  include Mongoid::Document

  after_save :recalculate_max_weigth_of_resources

  belongs_to :map_tile
  belongs_to :country

  has_one :general, class_name: 'Noble'

  has_many :regiments
  has_many :resources, as: :acquired_resources

  field :name, type: String
  field :max_weigth, type: Float, default: 0.0

  validates :name, presence: true, uniqueness: true
  validates :max_weigth, numericality: { greater_than_or_equal_to: 0 }
  validates :race, presence: true

  delegate :world, to: :country

  private

  # keep in mind that race stats will affect group.
  def recalculate_max_weigth_of_resources
    weigth_attribute_id = world.config(:weigth_attribute_id).weigth_attribute_id
    max_weigth_for_army = regiments.groups.map do |group|
      group.count * group.stats.of_kind(weigth_attribute_id).first.value
    end.sum
    self.update_attributes(:can_lift, weigth_for_army)
  end
end
