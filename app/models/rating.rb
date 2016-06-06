class Rating < ActiveRecord::Base
  validates :user_id, presence: true
  validates :beer_id, presence: true
  validates :value, presence: true
  validates_inclusion_of :value, :in => 1..5

  belongs_to :user
  belongs_to :beer
end
