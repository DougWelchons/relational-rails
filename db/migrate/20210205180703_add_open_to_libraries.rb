class AddOpenToLibraries < ActiveRecord::Migration[5.2]
  def change
    add_column :libraries, :open, :boolean
  end
end
