class AddYearsOpenToLibraries < ActiveRecord::Migration[5.2]
  def change
    add_column :libraries, :years_open, :integer
  end
end
