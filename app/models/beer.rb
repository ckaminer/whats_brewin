class Beer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :brewery_id, presence: true
  validates :style, presence: true

  belongs_to :brewery
end
