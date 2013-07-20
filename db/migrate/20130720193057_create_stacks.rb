class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.string :name
      t.text :description
      t.integer :stack_id

      t.timestamps
    end
  end
end
