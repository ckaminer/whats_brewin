class Style < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :beers
end
