class AddDateOfDepartureToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :date_of_departure, :date
  end
end
