class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  enum role: ["default", "admin"]

  has_many :ratings
  has_many :beers, through: :ratings
end
