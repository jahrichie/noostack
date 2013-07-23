class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :description
      t.integer :stack_id

      t.timestamps
    end
  end
end
