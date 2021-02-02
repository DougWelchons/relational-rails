class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.boolean :premium_member
      t.integer :skill_level
      t.timestamps
    end
  end
end
