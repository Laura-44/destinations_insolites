class AddDefaultStatusToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :status, :string, default: "En attente"
  end
end
