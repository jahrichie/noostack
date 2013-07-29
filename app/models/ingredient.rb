class Ingredient < ActiveRecord::Base

  #relationships
  belongs_to :stack
  attr_accessible :description, :name, :stack_id, :percentage
   
  # validates_uniqueness_of :name
  # validates_presence_of :name,:stack_id
end
