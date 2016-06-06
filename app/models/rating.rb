class Rating < ActiveRecord::Base
  validates :user_id, presence: true
  validates :beer_id, presence: true
  validates :rating, presence: true

  has_many :users
  has_many :beers
end
