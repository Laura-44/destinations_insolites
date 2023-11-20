class CreateDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :description
      t.date :date_of_availability
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
