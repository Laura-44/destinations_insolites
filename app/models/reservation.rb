class Reservation < ApplicationRecord
  belongs_to :destination
  belongs_to :user
  # validates_uniqueness_of :destination_id, scope: :user_id
end
