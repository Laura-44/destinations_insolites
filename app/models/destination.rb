class Destination < ApplicationRecord
  belongs_to :user
  has_many :users
  has_many :reservations
end
