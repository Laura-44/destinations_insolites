class AddDateOfArrivaleToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :date_of_arrival, :date
  end
end
