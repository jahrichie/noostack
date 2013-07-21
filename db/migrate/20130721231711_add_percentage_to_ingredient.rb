class AddPercentageToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :percentage, :INTEGER
  end
end
