class Race < Attributable
  include Mongoid::Document
  belongs_to :user
  has_and_belongs_to_many :origins, class_name: 'Race', inverse_of: :succesors
  has_and_belongs_to_many :succesors, class_name: 'Race', inverse_of: :origins
  has_many :people, class_name: 'Group'
  has_many :nobles
end