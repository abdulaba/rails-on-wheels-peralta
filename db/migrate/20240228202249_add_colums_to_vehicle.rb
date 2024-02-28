class AddColumsToVehicle < ActiveRecord::Migration[7.1]
  def change
    add_column :vehicles, :make, :string
    add_column :vehicles, :model, :string
    add_column :vehicles, :year, :integer
  end
end
