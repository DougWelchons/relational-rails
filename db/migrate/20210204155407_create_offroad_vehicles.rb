class CreateOffroadVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :offroad_vehicles do |t|
      t.string :name
      t.string :make
      t.string :model
      t.integer :tire_size
      t.boolean :passed_safety_inspection 
      t.timestamps
    end
  end
end
