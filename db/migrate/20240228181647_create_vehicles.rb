class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_type
      t.integer :seats
      t.references :user, null: false, foreign_key: true
      t.float :price
      t.string :description

      t.timestamps
    end
  end
end
