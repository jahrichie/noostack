class RemoveStackIdFromStacks < ActiveRecord::Migration
  def up
    remove_column :stacks, :stack_id
  end

  def down
    add_column :stacks, :stack_id, :integer
  end
end
