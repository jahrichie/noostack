class CreateStackImages < ActiveRecord::Migration
  def change
    create_table :stack_images do |t|
      t.string :name
      t.integer :stack_id
      t.string :url

      t.timestamps
    end
  end
end
